Return-Path: <linux-doc+bounces-44949-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7BAA5361
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 20:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857FF4C8A0B
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 18:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C8527780B;
	Wed, 30 Apr 2025 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Fijb56q/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787826AA83
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036670; cv=none; b=lpPnpcpii9sI3QjLgJAqvXt3jOFcYwey1zhwWqBXr77Dj35A4wK0lvNqV4sEvvbr/uwHaurWDNKwZiJdlT4+m4KyUFufH7KRwPckNQeAUTS9fvKuFSDWYWl33W2/m7AKyx+NMEF/Pf8t9RujFrn6w+Ol2y1bDXsOhm0/YpfOLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036670; c=relaxed/simple;
	bh=VWFOqfmgJ+Pn7eDy2V+gE2NZVAyqONSkMZstHobG2uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLwjt5dCB7Ahj14ZpuOyzYxqIAOgi3jCAaw0uz8llwIC4FQMxctLlH4TKa+WvH2c5Dz3KUnH7xKLHYdxZkeK17CLqYWZSC27pRH0O2FBqRhOcwP5BzTx+bmCczxOhs4bYvTA7nBVF6fAku61zGah2/Hct4doq3a8y6r9oOMrsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Fijb56q/; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774193fdffso3070491cf.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036666; x=1746641466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVmgGfYBmV/OlbM3vIMatHDFzxM6ptqaZjXn++F71GM=;
        b=Fijb56q/cb+/f+uOFfN6/ObwwZmEgkpeaDyELb38aVKdlpJm8DPtReElCGAb1mqegf
         CwIUtT46YHjDWe3HYdwBE+zaNX/ZCqDZif1lrseAN2tU/lrpgomfOk0ix8IBohpGhoXb
         1iqI3mj06pvpln3J/BmM0rGhp+wN+03jI0RvGlQ7mv5GXLaAcTsfN9y4knr7ZbDolLnf
         mSuANqY15EsBN4slValhOAMgJnuIIX89klojcNV6n1ErqMYhPG+Fo2qt+ZH/5dodHOSY
         8b+9BNanH1DcjxiBx6afktH3mtKpD3BpFXHAemAUfAyASjUuf2xqT6e8FBYefi0BUbTJ
         JUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036666; x=1746641466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVmgGfYBmV/OlbM3vIMatHDFzxM6ptqaZjXn++F71GM=;
        b=f7fjeA7OT3xQZL+l3DseLGVu0URNQVY7oYwU7PC4fEx5vE57r2AgETHeMGH6/VCN1a
         eBdiydXLuMBQHs8Iiu9a0LKg34QT9q1HuQ26kOaRrl/5v0NPb/b0Bm3Vq1n1mjR4GNAE
         m7rmtMzkglPoEV3FN4tljPjxGg5Alibma4NqIFnmE+UdRCri+HRpnpmJNvotkpLPNTjR
         FlnC+LfS0LHx7lCi37MMNRzYETCaiUzq4lB4hK7fB9i8dM9O/yhz4JQWpdHaNoveMApa
         uW4Y+5Z1N8CCtfk/nDYik3CeivGMnp+gB7pSmZU4x1kSTq+znzUpSGHbqRxqWpeQn5tT
         NAeQ==
X-Gm-Message-State: AOJu0YwZHEj1I3CRw1/F1veUa96KkJzfGZhyx/syjA0nsK5Y5FbSCC9H
	l7wGf42vpYJh71yx7XZhFEh12orijl61s1vRzi1Tcs+BCgC1R5i7Q/Y4c2jcr8g=
X-Gm-Gg: ASbGncvvmWNAmeH/S8387mS/Yv9SQMYqLdZI6sasqrndszW/gBlxHbIc8IegafekPK5
	SNIf7SMkr9M8IwmRTo/qRU6bebwsFegJRL4NyQTTMjdZkWfwdxU46r2ybi6eiytCouD3d3wnBLs
	mwu3Takv176m7eoKGWHne6m9+7O1NJR5n8COTPo+QS+aFbtuhngHKzKVEHAbyMt4Awr86thLqLG
	DUwdYZHmqKKKMpNtyQfmNMvERDBzbuHclwsLBiTKrsta7STnIFvN16tFKa1hBQxGDFofZihbd+c
	ff0dEPj/g7uNkZfosnaZ6XLb37uZUJ3khXxdYUpiVKPNzqVMkc3DZc85mum7isIafJzORCpHel/
	/1mFwJv6HIvbopRa5OeHx/RAq8mtP
X-Google-Smtp-Source: AGHT+IGcKMJcIHau07jxZ+o5UwEJXUA3OYvTS/n20sj8SIQ/bAk8uq7MQApMc9gf+SAiRuekyKxnrA==
X-Received: by 2002:a05:622a:5808:b0:47a:e6e1:c04f with SMTP id d75a77b69052e-489e67b4e81mr57460491cf.46.1746036666099;
        Wed, 30 Apr 2025 11:11:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:05 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH v2 04/18] cxl: docs/platform/acpi reference documentation
Date: Wed, 30 Apr 2025 14:10:34 -0400
Message-ID: <20250430181048.1197475-5-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic ACPI table information needed to understand the CXL
driver probe process.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |  1 +
 .../driver-api/cxl/platform/acpi.rst          | 76 +++++++++++++++++++
 .../driver-api/cxl/platform/acpi/cedt.rst     | 53 +++++++++++++
 .../driver-api/cxl/platform/acpi/dsdt.rst     | 28 +++++++
 .../driver-api/cxl/platform/acpi/hmat.rst     | 29 +++++++
 .../driver-api/cxl/platform/acpi/slit.rst     | 18 +++++
 .../driver-api/cxl/platform/acpi/srat.rst     | 38 ++++++++++
 7 files changed, 243 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/platform/acpi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/cedt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/dsdt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/hmat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/slit.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/srat.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index b8f82cdf1435..5e5699803d4c 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -27,6 +27,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Platform Configuration
 
    platform/bios-and-efi
+   platform/acpi
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/driver-api/cxl/platform/acpi.rst b/Documentation/driver-api/cxl/platform/acpi.rst
new file mode 100644
index 000000000000..ee7e6bd4c43d
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi.rst
@@ -0,0 +1,76 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+ACPI Tables
+===========
+
+ACPI is the "Advanced Configuration and Power Interface", which is a standard
+that defines how platforms and OS manage power and configure computer hardware.
+For the purpose of this theory of operation, when referring to "ACPI" we will
+usually refer to "ACPI Tables" - which are the way a platform (BIOS/EFI)
+communicates static configuration information to the operation system.
+
+The Following ACPI tables contain *static* configuration and performance data
+about CXL devices.
+
+.. toctree::
+   :maxdepth: 1
+
+   acpi/cedt.rst
+   acpi/srat.rst
+   acpi/hmat.rst
+   acpi/slit.rst
+   acpi/dsdt.rst
+
+The SRAT table may also contain generic port/initiator content that is intended
+to describe the generic port, but not information about the rest of the path to
+the endpoint.
+
+Linux uses these tables to configure kernel resources for statically configured
+(by BIOS/EFI) CXL devices, such as:
+
+- NUMA nodes
+- Memory Tiers
+- NUMA Abstract Distances
+- SystemRAM Memory Regions
+- Weighted Interleave Node Weights
+
+ACPI Debugging
+==============
+
+The :code:`acpidump -b` command dumps the ACPI tables into binary format.
+
+The :code:`iasl -d` command disassembles the files into human readable format.
+
+Example :code:`acpidump -b && iasl -d cedt.dat` ::
+
+   [000h 0000   4]   Signature : "CEDT"    [CXL Early Discovery Table]
+
+Common Issues
+-------------
+Most failures described here result in a failure of the driver to surface
+memory as a DAX device and/or kmem.
+
+* CEDT CFMWS targets list UIDs do not match CEDT CHBS UIDs.
+* CEDT CFMWS targets list UIDs do not match DSDT CXL Host Bridge UIDs.
+* CEDT CFMWS Restriction Bits are not correct.
+* CEDT CFMWS Memory regions are poorly aligned.
+* CEDT CFMWS Memory regions spans a platform memory hole.
+* CEDT CHBS UIDs do not match DSDT CXL Host Bridge UIDs.
+* CEDT CHBS Specification version is incorrect.
+* SRAT is missing regions described in CEDT CFMWS.
+
+  * Result: failure to create a NUMA node for the region, or
+    region is placed in wrong node.
+
+* HMAT is missing data for regions described in CEDT CFMWS.
+
+  * Result: NUMA node being placed in the wrong memory tier.
+
+* SLIT has bad data.
+
+  * Result: Lots of performance mechanisms in the kernel will be very unhappy.
+
+All of these issues will appear to users as if the driver is failing to
+support CXL - when in reality they are all the failure of a platform to
+configure the ACPI tables correctly.
diff --git a/Documentation/driver-api/cxl/platform/acpi/cedt.rst b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
new file mode 100644
index 000000000000..c8f904603fc6
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================
+CEDT - CXL Early Discovery Table
+================================
+
+The CXL Early Discovery Table is generated by BIOS to describe the CXL memory regions configured at boot by the BIOS.
+
+CHBS
+====
+The CXL Host Bridge Structure describes CXL host bridges.  Other than describing device register information, it reports the specific host bridge UID for this host bridge.  These host bridge ID's will be referenced in other tables.
+
+Example ::
+
+          Subtable Type : 00 [CXL Host Bridge Structure]
+               Reserved : 00
+                 Length : 0020
+ Associated host bridge : 00000007    <- Host bridge _UID
+  Specification version : 00000001
+               Reserved : 00000000
+          Register base : 0000010370400000
+        Register length : 0000000000010000
+
+CFMWS
+=====
+The CXL Fixed Memory Window structure describes a memory region associated with one or more CXL host bridges (as described by the CHBS).  It additionally describes any inter-host-bridge interleave configuration that may have been programmed by BIOS.
+
+Example ::
+
+            Subtable Type : 01 [CXL Fixed Memory Window Structure]
+                 Reserved : 00
+                   Length : 002C
+                 Reserved : 00000000
+      Window base address : 000000C050000000   <- Memory Region
+              Window size : 0000003CA0000000
+ Interleave Members (2^n) : 01                 <- Interleave configuration
+    Interleave Arithmetic : 00
+                 Reserved : 0000
+              Granularity : 00000000
+             Restrictions : 0006
+                    QtgId : 0001
+             First Target : 00000007           <- Host Bridge _UID
+              Next Target : 00000006           <- Host Bridge _UID
+
+The restriction field dictates what this SPA range may be used for (memory type, voltile vs persistent, etc). One or more bits may be set. ::
+
+  Bit[0]: CXL Type 2 Memory
+  Bit[1]: CXL Type 3 Memory
+  Bit[2]: Volatile Memory
+  Bit[3]: Persistent Memory
+  Bit[4]: Fixed Config (HPA cannot be re-used)
+
+INTRA-host-bridge interleave (multiple devices on one host bridge) is NOT reported in this structure, and is solely defined via CXL device decoder programming (host bridge and endpoint decoders).
diff --git a/Documentation/driver-api/cxl/platform/acpi/dsdt.rst b/Documentation/driver-api/cxl/platform/acpi/dsdt.rst
new file mode 100644
index 000000000000..b4583b01d67d
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/dsdt.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+DSDT - Differentiated system Description Table
+==============================================
+
+This table describes what peripherals a machine has.
+
+This table's UIDs for CXL devices - specifically host bridges, must be
+consistent with the contents of the CEDT, otherwise the CXL driver will
+fail to probe correctly.
+
+Example Compute Express Link Host Bridge ::
+
+    Scope (_SB)
+    {
+        Device (S0D0)
+        {
+            Name (_HID, "ACPI0016" /* Compute Express Link Host Bridge */)  // _HID: Hardware ID
+            Name (_CID, Package (0x02)  // _CID: Compatible ID
+            {
+                EisaId ("PNP0A08") /* PCI Express Bus */,
+                EisaId ("PNP0A03") /* PCI Bus */
+            })
+            ...
+            Name (_UID, 0x05)  // _UID: Unique ID
+            ...
+      }
diff --git a/Documentation/driver-api/cxl/platform/acpi/hmat.rst b/Documentation/driver-api/cxl/platform/acpi/hmat.rst
new file mode 100644
index 000000000000..a6a6ec9f2a32
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/hmat.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
+HMAT - Heterogeneous Memory Attribute Table
+===========================================
+
+The Heterogeneous Memory Attributes Table contains information such as cache attributes and bandwidth and latency details for memory proximity domains.  For the purpose of this document, we will only discuss the SSLIB entry.
+
+SLLBI
+=====
+The System Locality Latency and Bandwidth Information records latency and bandwidth information for proximity domains.
+
+This table is used by Linux to configure interleave weights and memory tiers.
+
+Example (Heavily truncated for brevity) ::
+
+               Structure Type : 0001 [SLLBI]
+                    Data Type : 00         <- Latency
+ Target Proximity Domain List : 00000000
+ Target Proximity Domain List : 00000001
+                        Entry : 0080       <- DRAM LTC
+                        Entry : 0100       <- CXL LTC
+
+               Structure Type : 0001 [SLLBI]
+                    Data Type : 03         <- Bandwidth
+ Target Proximity Domain List : 00000000
+ Target Proximity Domain List : 00000001
+                        Entry : 1200       <- DRAM BW
+                        Entry : 0200       <- CXL BW
diff --git a/Documentation/driver-api/cxl/platform/acpi/slit.rst b/Documentation/driver-api/cxl/platform/acpi/slit.rst
new file mode 100644
index 000000000000..8fd61b40a66c
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/slit.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+SLIT - System Locality Information Table
+========================================
+
+The system locality information table provides "abstract distances" between accessor and memory nodes.  Node without initiators (cpus) are infinitely (FF) distance away from all other nodes.
+
+The abstract distance described in this table does not describe any real latency of bandwidth information.
+
+Example ::
+
+    Signature : "SLIT"    [System Locality Information Table]
+   Localities : 0000000000000004
+ Locality   0 : 10 20 20 30
+ Locality   1 : 20 10 30 20
+ Locality   2 : FF FF 0A FF
+ Locality   3 : FF FF FF 0A
diff --git a/Documentation/driver-api/cxl/platform/acpi/srat.rst b/Documentation/driver-api/cxl/platform/acpi/srat.rst
new file mode 100644
index 000000000000..552a70969769
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/srat.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+SRAT - Static Resource Affinity Table
+=====================================
+
+The System/Static Resource Affinity Table describes resource (CPU, Memory) affinity to "Proximity Domains". This table is technically optional, but for performance information (see "HMAT") to be enumerated by linux it must be present.
+
+There is a careful dance between the CEDT and SRAT tables and how NUMA nodes are created.  If things don't look quite the way you expect - check the SRAT Memory Affinity entries and CEDT CFMWS to determine what your platform actually supports in terms of flexible topologies.
+
+The SRAT may statically assign portions of a CFMWS SPA range to a specific proximity domains.  See linux numa creation for more information about how this presents in the NUMA topology.
+
+Proximity Domain
+================
+A proximity domain is ROUGHLY equivalent to "NUMA Node" - though a 1-to-1 mapping is not guaranteed.  There are scenarios where "Proximity Domain 4" may map to "NUMA Node 3", for example.  (See "NUMA Node Creation")
+
+Memory Affinity
+===============
+Generally speaking, if a host does any amount of CXL fabric (decoder) programming in BIOS - an SRAT entry for that memory needs to be present.
+
+Example ::
+
+         Subtable Type : 01 [Memory Affinity]
+                Length : 28
+      Proximity Domain : 00000001          <- NUMA Node 1
+             Reserved1 : 0000
+          Base Address : 000000C050000000  <- Physical Memory Region
+        Address Length : 0000003CA0000000
+             Reserved2 : 00000000
+ Flags (decoded below) : 0000000B
+              Enabled : 1
+        Hot Pluggable : 1
+         Non-Volatile : 0
+
+Generic Initiator / Port
+========================
+
+todo
-- 
2.49.0


