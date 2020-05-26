Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8C91E206F
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2020 13:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388765AbgEZLEa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 May 2020 07:04:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28333 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388848AbgEZLE3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 07:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590491067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xIB7OS97s2nZ+MWLVT+97VqO3rsy+o4p/6eLpkkCoU4=;
        b=clNlHMFAMUATJaak9FjOH9K/woI1lmmIFAANPhxFPvJK5YUNaoZsPzt0A/hebfEXWJNPVD
        ihwZuQ/eZOzBBUBdpyOXXeRwjn8+8BtAlaSmJD4tPIzpftiCFFuOychIkhjLmBfQruZzDu
        wYqFC80keSDs8fV5/xQvYXWtisCH36U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-rjs7uq43O2uT91usz1bjJw-1; Tue, 26 May 2020 07:04:23 -0400
X-MC-Unique: rjs7uq43O2uT91usz1bjJw-1
Received: by mail-wm1-f72.google.com with SMTP id f9so948363wml.9
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 04:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIB7OS97s2nZ+MWLVT+97VqO3rsy+o4p/6eLpkkCoU4=;
        b=A5AxS3hFF2ulvfKpyJruVriKjKA+U7NrQpgBR+RXgrWyNjrjuDeD0heb22XXXCAWr6
         AGMPaRrc8JJzi/MZwRyY1mpnSQlRT/U7Tfd2koKfye8sCIhXyAsHYl/Pbtj24FGra5Cp
         8NclRIKrjssjJfdAjY1IxBgcER8nsxZyAPTgIleYVXdj24SIxz6Ldq5vLvWV9pPlHdvG
         87NcGQLVca6EhxXQyrGw+2u172W1RfZm/t5mTlhzVwkXflMFgV9wVPBLtXjUE752E7zS
         31Z20aMM7/KZACV0RsTuCNS7WvAt2egE4epHAS7f+6hsawEcUfghEVjGbUAzcgRd0KJ0
         JCXw==
X-Gm-Message-State: AOAM533iKZEV3KDW500d9wOZLwOnEFHfEAKVXGAuaEqiM68PQmqI/PTA
        kmtSfeurlKv58dHeUGdc7vq3MQnMLeCh7rJ/W3NXvRsZAg/5TrFOoMFaGfm8RjsHHVTWda181pD
        Ab14S9YlxULuU/DifsVii
X-Received: by 2002:adf:f907:: with SMTP id b7mr20031455wrr.203.1590491062075;
        Tue, 26 May 2020 04:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNw+hbSCOnwHhQ8PSLX7KyYKugJu8XcdkmlAYSig3h7ARIiT+NtvA9gyUHdwlenr+GkL4fBw==
X-Received: by 2002:adf:f907:: with SMTP id b7mr20031416wrr.203.1590491061680;
        Tue, 26 May 2020 04:04:21 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.118])
        by smtp.gmail.com with ESMTPSA id d6sm22928240wrj.90.2020.05.26.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 04:03:52 -0700 (PDT)
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Jonathan Adams <jwadams@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 2/7] documentation for stats_fs
Date:   Tue, 26 May 2020 13:03:12 +0200
Message-Id: <20200526110318.69006-3-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200526110318.69006-1-eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Html docs for a complete documentation of the stats_fs API,
filesystem and usage.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 Documentation/filesystems/index.rst    |   1 +
 Documentation/filesystems/stats_fs.rst | 222 +++++++++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 Documentation/filesystems/stats_fs.rst

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index e7b46dac7079..9a46fd851c6e 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -89,6 +89,7 @@ Documentation for filesystem implementations.
    relay
    romfs
    squashfs
+   stats_fs
    sysfs
    sysv-fs
    tmpfs
diff --git a/Documentation/filesystems/stats_fs.rst b/Documentation/filesystems/stats_fs.rst
new file mode 100644
index 000000000000..292c689ffb98
--- /dev/null
+++ b/Documentation/filesystems/stats_fs.rst
@@ -0,0 +1,222 @@
+========
+Stats_FS
+========
+
+Stats_fs is a synthetic ram-based virtual filesystem that takes care of
+gathering and displaying statistics for the Linux kernel subsystems.
+
+The motivation for stats_fs comes from the fact that there is no common
+way for Linux kernel subsystems to expose statistics to userspace shared
+throughout the Linux kernel; subsystems have to take care of gathering and
+displaying statistics by themselves, for example in the form of files in
+debugfs.
+
+Allowing each subsystem of the kernel to do so has two disadvantages.
+First, it will introduce redundant code. Second, debugfs is anyway not the
+right place for statistics (for example it is affected by lockdown).
+
+Stats_fs offers a generic and stable API, allowing any kind of
+directory/file organization and supporting multiple kind of aggregations
+(not only sum, but also average, max, min and count_zero) and data types
+(boolean, all unsigned/signed and custom types). The implementation takes
+care of gathering and displaying information at run time; users only need
+to specify the values to be included in each source. Optionally, users can
+also provide a display function for each value, that will take care of
+displaying the provided value in a custom format.
+
+Its main function is to display each statistics as a file in the desired
+folder hierarchy defined through the API. Stats_fs files can be read, and
+possibly cleared if their file mode allows it.
+
+Stats_fs is typically mounted with a command like::
+
+    mount -t stats_fs stats_fs /sys/kernel/stats_fs
+
+(Or an equivalent /etc/fstab line).
+
+Stats_fs has two main components: the public API defined by
+include/linux/stats_fs.h, and the virtual file system in
+/sys/kernel/stats.
+
+The API has two main elements, values and sources. Kernel
+subsystems will create a source, add child
+sources/values/aggregates and register it to the root source (that on the
+virtual fs would be /sys/kernel/stats).
+
+The stats_fs API is defined in ``<linux/stats_fs.h>``.
+
+    Sources
+        Sources are created via ``stats_fs_source_create()``, and each
+        source becomes a directory in the file system. Sources form a
+        parent-child relationship; root sources are added to the file
+        system via ``stats_fs_source_register()``. Therefore each Linux
+        subsystem will add its own entry to the root, filesystem similar
+        to what it is done in debugfs. Every other source is added to or
+        removed from a parent through the
+        ``stats_fs_source_add_subordinate()`` and
+        ``stats_fs_source_remove_subordinate()`` APIs. Once a source is
+        created and added to the tree (via add_subordinate), it will be
+        used to compute aggregate values in the parent source. A source
+        can optionally be hidden from the filesystem but still considered
+        in the aggregation operations if the corresponding flag is set
+        during initialization.
+
+    Values
+        Values represent quantites that are gathered by the stats_fs user.
+        Examples of values include the number of vm exits of a given kind,
+        the amount of memory used by some data structure, the length of
+        the longest hash table chain, or anything like that. Values are
+        defined with the stats_fs_source_add_values function. Each value
+        is defined by a ``struct stats_fs_value``; the same
+        ``stats_fs_value`` can be added to many different sources. A value
+        can be considered "simple" if it fetches data from a user-provided
+        location, or "aggregate" if it groups all values in the
+        subordinate sources that include the same ``stats_fs_value``.
+        Values by default are considered to be cumulative, meaning the
+        value they represent never decreases, but can also be defined as
+        floating if they exibith a different behavior. The main difference
+        between these two is reflected into the file permission, since a
+        floating value file does not allow the user to clear it. Each
+        value has a ``stats_fs_type`` pointer in order to allow the user
+        to provide custom get and clear functions. The library, however,
+        also exports default ``stats_fs_type`` structs for the standard
+        types (all unsigned and signed types plus boolean). A value can
+        also provide a show function that takes care of displaying the
+        value in a custom string format. This can be especially useful
+        when displaying enums.
+
+Because stats_fs is a different mountpoint than debugfs, it is not affected
+by security lockdown.
+
+Using Stats_fs
+================
+
+Define a value::
+
+        struct statistics{
+                uint64_t exit;
+                ...
+        };
+
+        struct kvm {
+                ...
+                struct statistics stat;
+        };
+
+        struct stats_fs_value kvm_stats[] = {
+                { "exit_vm", offsetof(struct kvm, stat.exit), &stats_fs_type_u64,
+                  STATS_FS_SUM },
+                { NULL }
+        };
+
+The same ``struct stats_fs_value`` is used for both simple and aggregate
+values, though the type and offset are only used for simple values.
+Aggregates merge all values that use the same ``struct stats_fs_value``.
+
+Create the parent source::
+
+        struct stats_fs_source parent_source = stats_fs_source_create(0, "parent");
+
+Register it (files and folders
+will only be visible after this function is called)::
+
+        stats_fs_source_register(parent_source);
+
+Create and add a child::
+
+        struct stats_fs_source child_source = stats_fs_source_create(STATS_FS_HIDDEN, "child");
+
+        stats_fs_source_add_subordinate(parent_source, child_source);
+
+The STATS_FS_HIDDEN attribute won't affect the aggregation, it will only
+block the creation of the files.
+
+Add values to parent and child (also here order doesn't matter)::
+
+        struct kvm *base_ptr = kmalloc(..., sizeof(struct kvm));
+        ...
+        stats_fs_source_add_values(child_source, kvm_stats, base_ptr, 0);
+        stats_fs_source_add_values(parent_source, kvm_stats, NULL, STATS_FS_HIDDEN);
+
+``child_source`` will be a simple value, since it has a non-NULL base
+pointer, while ``parent_source`` will be an aggregate. During the adding
+phase, also values can optionally be marked as hidden, so that the folder
+and other values can be still shown.
+
+Of course the same ``struct stats_fs_value`` array can be also passed with a
+different base pointer, to represent the same value but in another instance
+of the kvm struct.
+
+Search:
+
+Fetch a value from the child source, returning the value
+pointed by ``(uint64_t *) base_ptr + kvm_stats[0].offset``::
+
+        uint64_t ret_child, ret_parent;
+
+        stats_fs_source_get_value(child_source, &kvm_stats[0], &ret_child);
+
+Fetch an aggregate value, searching all subsources of ``parent_source`` for
+the specified ``struct stats_fs_value``::
+
+        stats_fs_source_get_value(parent_source, &kvm_stats[0], &ret_parent);
+
+        assert(ret_child == ret_parent); // check expected result
+
+To make it more interesting, add another child::
+
+        struct stats_fs_source child_source2 = stats_fs_source_create(0, "child2");
+
+        stats_fs_source_add_subordinate(parent_source, child_source2);
+        // now  the structure is parent -> child1
+        //                              -> child2
+
+        struct kvm *other_base_ptr = kmalloc(..., sizeof(struct kvm));
+        ...
+        stats_fs_source_add_values(child_source2, kvm_stats, other_base_ptr, 0);
+
+Note that other_base_ptr points to another instance of kvm, so the struct
+stats_fs_value is the same but the address at which they point is not.
+
+Now get the aggregate value::
+
+        uint64_t ret_child, ret_child2, ret_parent;
+
+        stats_fs_source_get_value(child_source, &kvm_stats[0], &ret_child);
+        stats_fs_source_get_value(parent_source, &kvm_stats[0], &ret_parent);
+        stats_fs_source_get_value(child_source2, &kvm_stats[0], &ret_child2);
+
+        assert((ret_child + ret_child2) == ret_parent);
+
+Cleanup::
+
+        stats_fs_source_remove_subordinate(parent_source, child_source);
+        stats_fs_source_revoke(child_source);
+        stats_fs_source_put(child_source);
+
+        stats_fs_source_remove_subordinate(parent_source, child_source2);
+        stats_fs_source_revoke(child_source2);
+        stats_fs_source_put(child_source2);
+
+        stats_fs_source_put(parent_source);
+        kfree(other_base_ptr);
+        kfree(base_ptr);
+
+Calling stats_fs_source_revoke is very important, because it will ensure
+that stats_fs will not access the data that were passed to
+stats_fs_source_add_value for this source.
+
+Because open files increase the reference count for a stats_fs_source, the
+source can end up living longer than the data that provides the values for
+the source.  Calling stats_fs_source_revoke just before the backing data
+is freed avoids accesses to freed data structures. The sources will return
+0.
+
+This is not needed for the parent_source, since it just contains
+aggregates that would be 0 anyways if no matching child value exist.
+
+API Documentation
+=================
+
+.. kernel-doc:: include/linux/stats_fs.h
+   :export: fs/stats_fs/*.c
\ No newline at end of file
-- 
2.25.4

