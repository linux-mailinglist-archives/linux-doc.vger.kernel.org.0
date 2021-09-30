Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FF741DC95
	for <lists+linux-doc@lfdr.de>; Thu, 30 Sep 2021 16:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351115AbhI3Onv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Sep 2021 10:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21554 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351102AbhI3Onu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Sep 2021 10:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633012927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nzXD5cjKF7FslAepTN5/nLeuBpN4bisQvTOXO6EZOBE=;
        b=dT9tXUHUXOJgh7eYFmOdze7G0h/3SC/4Mj8uW4Yzqn5t7oaoIsU3l6Hn9AvQ0SicNWybak
        coqfJnT6xSlnE6YdAZWcv2oLec1FcdEkxUxEONuNvWRbGTxU5k65MCJq/Ps1mYFJSThLTU
        yVHU6DMdVES/qR/2z4C32nZewifCbEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Xcvgvp03MRmls9rkUeYCOg-1; Thu, 30 Sep 2021 10:42:04 -0400
X-MC-Unique: Xcvgvp03MRmls9rkUeYCOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA8C9101F024;
        Thu, 30 Sep 2021 14:42:02 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.155])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B29E55F4E0;
        Thu, 30 Sep 2021 14:41:41 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v1 3/3] memory-hotplug.rst: document the "auto-movable" online policy
Date:   Thu, 30 Sep 2021 16:41:17 +0200
Message-Id: <20210930144117.23641-4-david@redhat.com>
In-Reply-To: <20210930144117.23641-1-david@redhat.com>
References: <20210930144117.23641-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In commit e83a437faa62 ("mm/memory_hotplug: introduce "auto-movable" online
policy") we introduced a new memory online policy to automatically
select a zone for memory blocks to be onlined. We added a way to
set the active online policy and tunables for the auto-movable online
policy. In follow-up commits we tweaked the "auto-movable" policy to also
consider memory device details when selecting zones for memory blocks to
be onlined.

Let's document the new toggles and how the two online policies we have
work.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .../admin-guide/mm/memory-hotplug.rst         | 128 +++++++++++++++---
 1 file changed, 108 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index ee00b70dedde..c20a2c0031cf 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -165,9 +165,8 @@ Or alternatively::
 
 	% echo 1 > /sys/devices/system/memory/memoryXXX/online
 
-The kernel will select the target zone automatically, usually defaulting to
-``ZONE_NORMAL`` unless ``movable_node`` has been specified on the kernel
-command line or if the memory block would intersect the ZONE_MOVABLE already.
+The kernel will select the target zone automatically, depending on the
+configured ``online_policy``.
 
 One can explicitly request to associate an offline memory block with
 ZONE_MOVABLE by::
@@ -198,6 +197,9 @@ Auto-onlining can be enabled by writing ``online``, ``online_kernel`` or
 
 	% echo online > /sys/devices/system/memory/auto_online_blocks
 
+Similarly to manual onlining, with ``online`` the kernel will select the
+target zone automatically, depending on the configured ``online_policy``.
+
 Modifying the auto-online behavior will only affect all subsequently added
 memory blocks only.
 
@@ -393,9 +395,11 @@ command line parameters are relevant:
 ======================== =======================================================
 ``memhp_default_state``	 configure auto-onlining by essentially setting
                          ``/sys/devices/system/memory/auto_online_blocks``.
-``movable_node``	 configure automatic zone selection in the kernel. When
-			 set, the kernel will default to ZONE_MOVABLE, unless
-			 other zones can be kept contiguous.
+``movable_node``	 configure automatic zone selection in the kernel when
+			 using the ``contig-zones`` online policy. When
+			 set, the kernel will default to ZONE_MOVABLE when
+			 onlining a memory block, unless other zones can be kept
+			 contiguous.
 ======================== =======================================================
 
 Module Parameters
@@ -414,20 +418,104 @@ and they can be observed (and some even modified at runtime) via::
 
 The following module parameters are currently defined:
 
-======================== =======================================================
-``memmap_on_memory``	 read-write: Allocate memory for the memmap from the
-			 added memory block itself. Even if enabled, actual
-			 support depends on various other system properties and
-			 should only be regarded as a hint whether the behavior
-			 would be desired.
-
-			 While allocating the memmap from the memory block
-			 itself makes memory hotplug less likely to fail and
-			 keeps the memmap on the same NUMA node in any case, it
-			 can fragment physical memory in a way that huge pages
-			 in bigger granularity cannot be formed on hotplugged
-			 memory.
-======================== =======================================================
+================================ ===============================================
+``memmap_on_memory``		 read-write: Allocate memory for the memmap from
+				 the added memory block itself. Even if enabled,
+				 actual support depends on various other system
+				 properties and should only be regarded as a
+				 hint whether the behavior would be desired.
+
+				 While allocating the memmap from the memory
+				 block itself makes memory hotplug less likely
+				 to fail and keeps the memmap on the same NUMA
+				 node in any case, it can fragment physical
+				 memory in a way that huge pages in bigger
+				 granularity cannot be formed on hotplugged
+				 memory.
+``online_policy``		 read-write: Set the basic policy used for
+				 automatic zone selection when onlining memory
+				 blocks without specifying a target zone.
+				 ``contig-zones`` has been the kernel default
+				 before this parameter was added. After an
+				 online policy was configured and memory was
+				 online, the policy should not be changed
+				 anymore.
+
+				 When set to ``contig-zones``, the kernel will
+				 try keeping zones contiguous. If a memory block
+				 intersects multiple zones or no zone, the
+				 behavior depends on the ``movable_node`` kernel
+				 command line parameter: default to ZONE_MOVABLE
+				 if set, default to the applicable kernel zone
+				 (usually ZONE_NORMAL) if not set.
+
+				 When set to ``auto-movable``, the kernel will
+				 try onlining memory blocks to ZONE_MOVABLE if
+				 possible according to the configuration and
+				 memory device details. With this policy, one
+				 can avoid zone imbalances when eventually
+				 hotplugging a lot of memory later and still
+				 wanting to be able to hotunplug as much as
+				 possible reliably, very desirable in
+				 virtualized environments. As one example, a
+				 hotplugged DIMM will be onlined either
+				 completely to ZONE_MOVABLE or completely to
+				 ZONE_NORMAL, not a mixture.
+				 As another example, as many memory blocks
+				 belonging to a virtio-mem device will be
+				 onlined to ZONE_MOVABLE as possible,
+				 special-casing units of memory blocks that can
+				 only get hotunplugged together. *This policy
+				 does not protect from setups that are
+				 problematic with ZONE_MOVABLE and does not
+				 change the zone of memory blocks dynamically
+				 after they were onlined.*
+``auto_movable_ratio``		 read-write: Set the maximum MOVABLE:KERNEL
+				 memory ratio in % for the ``auto-movable``
+				 online policy. Whether the ratio applies only
+				 for the system across all NUMA nodes or also
+				 per NUMA nodes depends on the
+				 ``auto_movable_numa_aware`` configuration.
+
+				 All accounting is based on present memory pages
+				 in the zones combined with accounting per
+				 memory device. Memory dedicated to the CMA
+				 allocator is accounted as MOVABLE, although
+				 residing on one of the kernel zones. The
+				 possible ratio depends on the actual workload.
+				 The kernel default is "301" %, for example,
+				 allowing for hotplugging 24 GiB to a 8 GiB VM
+				 and automatically onlining all hotplugged
+				 memory to ZONE_MOVABLE in many setups. The
+				 additional 1% deals with some pages being not
+				 present, for example, because of some firmware
+				 allocations.
+
+				 Note that ZONE_NORMAL memory provided by one
+				 memory device does not allow for more
+				 ZONE_MOVABLE memory for a different memory
+				 device. As one example, onlining memory of a
+				 hotplugged DIMM to ZONE_NORMAL will not allow
+				 for another hotplugged DIMM to get onlined to
+				 ZONE_MOVABLE automatically. In contrast, memory
+				 hotplugged by a virtio-mem device that got
+				 onlined to ZONE_NORMAL will allow for more
+				 ZONE_MOVABLE memory within *the same*
+				 virtio-mem device.
+``auto_movable_numa_aware``	 read-write: Configure whether the
+				 ``auto_movable_ratio`` in the ``auto-movable``
+				 online policy also applies per NUMA
+				 node in addition to the whole system across all
+				 NUMA nodes. The kernel default is "Y".
+
+				 Disabling NUMA awareness can be helpful when
+				 dealing with NUMA nodes that should be
+				 completely hotunpluggable, onlining the memory
+				 completely to ZONE_MOVABLE automatically if
+				 possible.
+
+				 Parameter availability depends on CONFIG_NUMA.
+================================ ===============================================
 
 ZONE_MOVABLE
 ============
-- 
2.31.1

