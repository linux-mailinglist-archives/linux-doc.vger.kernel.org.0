Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C7D108510
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2019 22:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfKXVOP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Nov 2019 16:14:15 -0500
Received: from mga06.intel.com ([134.134.136.31]:39088 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbfKXVOO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 24 Nov 2019 16:14:14 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Nov 2019 13:14:14 -0800
X-IronPort-AV: E=Sophos;i="5.69,239,1571727600"; 
   d="scan'208";a="358651187"
Received: from dwillia2-desk3.jf.intel.com (HELO dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Nov 2019 13:14:14 -0800
Subject: [PATCH v3 3/3] libnvdimm, MAINTAINERS: Maintainer Entry Profile
From:   Dan Williams <dan.j.williams@intel.com>
To:     corbet@lwn.net
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
        linux-doc@vger.kernel.org
Date:   Sun, 24 Nov 2019 12:59:58 -0800
Message-ID: <157462919825.1729495.5877405723948988416.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <157462918268.1729495.10257190766638995699.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <157462918268.1729495.10257190766638995699.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the basic policies of the libnvdimm subsystem and provide a first
example of a Maintainer Entry Profile for others to duplicate and edit.

Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 Documentation/nvdimm/maintainer-entry-profile.rst |   59 +++++++++++++++++++++
 MAINTAINERS                                       |    4 +
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/nvdimm/maintainer-entry-profile.rst

diff --git a/Documentation/nvdimm/maintainer-entry-profile.rst b/Documentation/nvdimm/maintainer-entry-profile.rst
new file mode 100644
index 000000000000..77081fd9be95
--- /dev/null
+++ b/Documentation/nvdimm/maintainer-entry-profile.rst
@@ -0,0 +1,59 @@
+LIBNVDIMM Maintainer Entry Profile
+==================================
+
+Overview
+--------
+The libnvdimm subsystem manages persistent memory across multiple
+architectures. The mailing list, is tracked by patchwork here:
+https://patchwork.kernel.org/project/linux-nvdimm/list/
+...and that instance is configured to give feedback to submitters on
+patch acceptance and upstream merge. Patches are merged to either the
+'libnvdimm-fixes', or 'libnvdimm-for-next' branch. Those branches are
+available here:
+https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git/
+
+In general patches can be submitted against the latest -rc, however if
+the incoming code change is dependent on other pending changes then the
+patch should be based on the libnvdimm-for-next branch. However, since
+persistent memory sits at the intersection of storage and memory there
+are cases where patches are more suitable to be merged through a
+Filesystem or the Memory Management tree. When in doubt copy the nvdimm
+list and the maintainers will help route.
+
+Submissions will be exposed to the kbuild robot for compile regression
+testing. It helps to get a success notification from that infrastructure
+before submitting, but it is not required.
+
+
+Submit Checklist Addendum
+-------------------------
+There are unit tests for the subsystem via the ndctl utility:
+https://github.com/pmem/ndctl
+Those tests need to be passed before the patches go upstream, but not
+necessarily before initial posting. Contact the list if you need help
+getting the test environment set up.
+
+### ACPI Device Specific Methods (_DSM)
+Before patches enabling for a new _DSM family will be considered it must
+be assigned a format-interface-code from the NVDIMM Sub-team of the ACPI
+Specification Working Group. In general, the stance of the subsystem is
+to push back on the proliferation of NVDIMM command sets, do strongly
+consider implementing support for an existing command set. See
+drivers/acpi/nfit/nfit.h for the set of support command sets.
+
+
+Key Cycle Dates
+---------------
+New submissions can be sent at any time, but if they intend to hit the
+next merge window they should be sent before -rc4, and ideally
+stabilized in the libnvdimm-for-next branch by -rc6. Of course if a
+patch set requires more than 2 weeks of review -rc4 is already too late
+and some patches may require multiple development cycles to review.
+
+
+Review Cadence
+--------------
+In general, please wait up to one week before pinging for feedback. A
+private mail reminder is preferred. Alternatively ask for other
+developers that have Reviewed-by tags for libnvdimm changes to take a
+look and offer their opinion.
diff --git a/MAINTAINERS b/MAINTAINERS
index e5d111a86e61..2be1e18a368e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9185,6 +9185,7 @@ M:	Dan Williams <dan.j.williams@intel.com>
 M:	Vishal Verma <vishal.l.verma@intel.com>
 M:	Dave Jiang <dave.jiang@intel.com>
 L:	linux-nvdimm@lists.01.org
+P:	Documentation/nvdimm/maintainer-entry-profile.rst
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 S:	Supported
 F:	drivers/nvdimm/blk.c
@@ -9195,6 +9196,7 @@ M:	Vishal Verma <vishal.l.verma@intel.com>
 M:	Dan Williams <dan.j.williams@intel.com>
 M:	Dave Jiang <dave.jiang@intel.com>
 L:	linux-nvdimm@lists.01.org
+P:	Documentation/nvdimm/maintainer-entry-profile.rst
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 S:	Supported
 F:	drivers/nvdimm/btt*
@@ -9204,6 +9206,7 @@ M:	Dan Williams <dan.j.williams@intel.com>
 M:	Vishal Verma <vishal.l.verma@intel.com>
 M:	Dave Jiang <dave.jiang@intel.com>
 L:	linux-nvdimm@lists.01.org
+P:	Documentation/nvdimm/maintainer-entry-profile.rst
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 S:	Supported
 F:	drivers/nvdimm/pmem*
@@ -9223,6 +9226,7 @@ M:	Dave Jiang <dave.jiang@intel.com>
 M:	Keith Busch <keith.busch@intel.com>
 M:	Ira Weiny <ira.weiny@intel.com>
 L:	linux-nvdimm@lists.01.org
+P:	Documentation/nvdimm/maintainer-entry-profile.rst
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
 S:	Supported

