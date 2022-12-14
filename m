Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82BB64CFCF
	for <lists+linux-doc@lfdr.de>; Wed, 14 Dec 2022 19:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbiLNS5e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Dec 2022 13:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238281AbiLNS5d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Dec 2022 13:57:33 -0500
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055FD2A739
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 10:57:31 -0800 (PST)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BEIvGpq030272
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 13:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1671044238; bh=11FUBO4NONzLRcgp2kqDfKXxR5LRpcv4tC9sMWYFhfI=;
        h=From:To:Cc:Subject:Date;
        b=KZm++EP7JbHgoccID8ZBiAEDB77AhJ8DBh44SBXGz3sctI6st2Dt5YpWYWDDps6rK
         t/F/Cu8QFLh5WeDpDoJzxiov/yTTC6E0ikKSDfnEQjBFe0D/tjMPQ+JBLCbkKv8/3+
         46pxM+CrU8LHNxLtslzzCl+K0yjHH1PhEvPXnK0TfH2JuY4X0bIVSjgU6iWC/p6Qty
         3BOmDLj7mpslEgLtzIW4TXGuh3ef7kqIDSs4Xu3AmBeOm2mKJFkuAtnpc6eLNkOvxl
         zPrz8T3HeOcK7arUDeD9m1g7MtVB3WiwTA/EpGz/w/a8LrJDMJuXQrOF88+2eAm+Aw
         XU8Ym3obI2xnw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id 9D71315C40A2; Wed, 14 Dec 2022 13:57:16 -0500 (EST)
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     linux-doc@vger.kernel.org
Cc:     "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH] Documentation/process: Add Linux Kernel Contribution Maturity Model
Date:   Wed, 14 Dec 2022 13:57:14 -0500
Message-Id: <20221214185714.868374-1-tytso@mit.edu>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As a follow-up to a discussion at the 2021 Maintainer's Summit on the
topic of maintainer recruitment and retention, the TAB took on the
task of creating a document which to help companies and other
organizations to grow in their ability to engage with the Linux Kernel
development community, using the Maturity Model[2] framework.

The goal is to encourage, in a management-friendly way, companies to
allow their engineers to contribute with the upstream Linux Kernel
development community, so we can grow the "talent pipeline" for
contributors to become respected leaders, and eventually kernel
maintainers.

[1] https://lwn.net/Articles/870581/
[2] https://en.wikipedia.org/wiki/Maturity_model

Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 .../process/contribution-maturity-model.rst   | 111 ++++++++++++++++++
 Documentation/process/index.rst               |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/process/contribution-maturity-model.rst

diff --git a/Documentation/process/contribution-maturity-model.rst b/Documentation/process/contribution-maturity-model.rst
new file mode 100644
index 000000000000..39a2b6b116ca
--- /dev/null
+++ b/Documentation/process/contribution-maturity-model.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _contribution_maturity_model:
+
+========================================
+Linux Kernel Contribution Maturity Model
+========================================
+
+
+Background
+==========
+
+As a part of the 2021 Linux Kernel Maintainers’ Summit, there was a
+`discussion <https://lwn.net/Articles/870581/>`_ about the challenges in
+recruiting kernel maintainers as well as maintainer succession.  Some of
+the conclusions from that discussion included that companies which are a
+part of the Linux Kernel community need to allow engineers to be
+maintainers as part of their job, so they can grow into becoming
+respected leaders and eventually, kernel maintainers.  To support a
+strong talent pipeline, developers need to allowed and encouraged to
+take on upstream contributions such as reviewing other people’s patches,
+refactoring kernel infrastructure, and writing documentation.
+
+To that end, the Linux Foundation Technical Advisory Board (TAB)
+proposes this Linux Kernel Contribution Maturity Model. These common
+expectations for upstream community engagement aim to increase the
+influence of individual developers, increase the collaboration of
+organizations, and improve the overall health of the Linux Kernel
+ecosystem.
+
+The TAB urges organizations to continuously evaluate their Open Source
+maturity model and commit to improvements to align with this model.  To
+be effective, this evaluation should incorporate feedback from across
+the organization, including management and developers at all seniority
+levels.  In the spirit of Open Source, we encourage organizations to
+publish their evaluations and plans to improve their engagement with the
+upstream community.
+
+Level 0
+=======
+
+* Software Engineers are not allowed to contribute patches to the Linux
+  kernel.
+
+
+Level 1
+=======
+
+* Software Engineers are allowed to contribute patches to the Linux
+  kernel, either as part of their job responsibilities or on their own
+  time.
+
+Level 2
+=======
+
+* Software Engineers are expected to contribute to the Linux Kernel as
+  part of their job responsibilities.
+* Software Engineers will be supported to attend Linux-related
+  conferences as a part of their job.
+* A Software Engineer’s upstream code contributions shall be considered
+  in promotion and performance reviews.
+
+Level 3
+=======
+
+* Software Engineers are expected to review patches (including patches
+  authored by engineers from other companies) as part of their job
+  responsibilities
+* Contributing presentations or papers to Linux-related conferences are
+  considered part of an engineer’s work.
+* A Software Engineer’s community contributions shall be considered in
+  promotion and performance reviews.
+* Organizations shall regularly report metrics of their open source
+  contributions and track these metrics over time.  These metrics may be
+  published only internally within the organization, or at the
+  organization’s discretion, some or all may be published externally.
+  Metrics that are strongly suggested include:
+
+  * The number of upstream kernel contributions by engineer, team, and
+    organization (e.g., all people reporting up to a manager, director,
+    or VP).
+  * The percentage of kernel developers who have made upstream
+    contributions relative to the total kernel developers in the
+    organization.
+  * The time interval between kernels used in the organization’s servers
+    and/or products, and the publication date of the upstream kernel
+    upon which the internal kernel is based.
+  * The number of out-of-tree commits present in internal kernels.
+
+Level 4
+=======
+
+* Software Engineers are encouraged to spend a portion of their work
+  time focused on Upstream Work, which is defined as reviewing patches
+  or papers, improving core project infrastructure such as writing or
+  maintaining tests, upstream tech debt reduction, writing
+  documentation, etc.
+* Software Engineers are supported in helping to organize Linux-related
+  conferences.
+* Organizations shall consider community member feedback in official
+  performance reviews.
+
+Level 5
+=======
+
+* Upstream kernel development is considered a formal job position, with
+  at least a third of the engineer’s time spent doing Upstream Work.
+* Organizations shall actively seek out community member feedback as a
+  factor in official performance reviews.
+* Organizations shall regularly report internally on the ratio of
+  Upstream Work to work focused on directly pursuing business goals.
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index d4b6217472b0..33715da7e684 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -50,6 +50,7 @@ Other guides to the community that are of interest to most developers are:
    embargoed-hardware-issues
    maintainers
    researcher-guidelines
+   contribution-maturity-model
 
 These are some overall technical guides that have been put here for now for
 lack of a better place.
-- 
2.31.0

