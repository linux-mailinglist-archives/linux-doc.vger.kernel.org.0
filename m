Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1F6BAFB
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2019 13:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfGQLFk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Jul 2019 07:05:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47046 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfGQLFi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OluVRdXbjYYSU9Uqqe5TfW6PdnnT7bAHARf2U7KKKjc=; b=lE3NL17HL91dhpGmXIcj+hr/+p
        /SlmMnPFt+GCO6++0MHl+flH7Rpz/nqn58qdZCVSzwm95FB4y9eK+uZRPOPz2AVOI89GTC9BvrZ0O
        1vpvaPga1se0fsR7jd0HvEFV6hsjcW+wN7qb9bfoPzf/Sdtsku3zhpBr/RlToMbcjR0QCh89NCuv7
        fD3NLwYqS45t8JLQ2tOWURXGgIBkHpHZDfDbx/mN/gtH7m0wLl+Ca+kT/V0Jttelp75dFi9NNkXHv
        4SLC+H5dBTv1R8nc77beYoRxkLlsacZnq70DbPM29w6d/W95ScUGvKy00ORr43wWdYvzC0pkPS7a6
        VU81PJbQ==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054N-Mh; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-00039g-PO; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 12/20] docs: add ABI documentation to the admin-guide book
Date:   Wed, 17 Jul 2019 08:05:25 -0300
Message-Id: <7cf610aa42fde6730499bfaf19bc490379c729c3.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As we don't want a generic Sphinx extension to execute commands,
change the one proposed to Markus to call the abi_book.pl
script.

Use a script to parse the Documentation/ABI directory and output
it at the admin-guide.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst | 10 ++++++++++
 Documentation/admin-guide/abi-removed.rst  |  4 ++++
 Documentation/admin-guide/abi-stable.rst   | 13 +++++++++++++
 Documentation/admin-guide/abi-testing.rst  | 19 +++++++++++++++++++
 Documentation/admin-guide/abi.rst          | 11 +++++++++++
 Documentation/admin-guide/index.rst        |  2 ++
 Documentation/conf.py                      |  2 +-
 7 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/abi-obsolete.rst
 create mode 100644 Documentation/admin-guide/abi-removed.rst
 create mode 100644 Documentation/admin-guide/abi-stable.rst
 create mode 100644 Documentation/admin-guide/abi-testing.rst
 create mode 100644 Documentation/admin-guide/abi.rst

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
new file mode 100644
index 000000000000..cda9168445a5
--- /dev/null
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -0,0 +1,10 @@
+ABI obsolete symbols
+====================
+
+Documents interfaces that are still remaining in the kernel, but are
+marked to be removed at some later point in time.
+
+The description of the interface will document the reason why it is
+obsolete and when it can be expected to be removed.
+
+.. kernel-abi:: $srctree/Documentation/ABI/obsolete
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
new file mode 100644
index 000000000000..497978fc9632
--- /dev/null
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -0,0 +1,4 @@
+ABI removed symbols
+===================
+
+.. kernel-abi:: $srctree/Documentation/ABI/removed
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
new file mode 100644
index 000000000000..7495d7a35048
--- /dev/null
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -0,0 +1,13 @@
+ABI stable symbols
+==================
+
+Documents the interfaces that the developer has defined to be stable.
+
+Userspace programs are free to use these interfaces with no
+restrictions, and backward compatibility for them will be guaranteed
+for at least 2 years.
+
+Most interfaces (like syscalls) are expected to never change and always
+be available.
+
+.. kernel-abi:: $srctree/Documentation/ABI/stable
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
new file mode 100644
index 000000000000..5c886fc50b9e
--- /dev/null
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -0,0 +1,19 @@
+ABI testing symbols
+===================
+
+Documents interfaces that are felt to be stable,
+as the main development of this interface has been completed.
+
+The interface can be changed to add new features, but the
+current interface will not break by doing this, unless grave
+errors or security problems are found in them.
+
+Userspace programs can start to rely on these interfaces, but they must
+be aware of changes that can occur before these interfaces move to
+be marked stable.
+
+Programs that use these interfaces are strongly encouraged to add their
+name to the description of these interfaces, so that the kernel
+developers can easily notify them if any changes occur.
+
+.. kernel-abi:: $srctree/Documentation/ABI/testing
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
new file mode 100644
index 000000000000..3b9645c77469
--- /dev/null
+++ b/Documentation/admin-guide/abi.rst
@@ -0,0 +1,11 @@
+=====================
+Linux ABI description
+=====================
+
+.. toctree::
+   :maxdepth: 1
+
+   abi-stable
+   abi-testing
+   abi-obsolete
+   abi-removed
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 280355d08af5..acdf2cd1d186 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -18,6 +18,8 @@ etc.
    devices
    sysctl/index
 
+   abi
+
 This section describes CPU vulnerabilities and their mitigations.
 
 .. toctree::
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 3b2397bcb565..35c1960ea15d 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -35,7 +35,7 @@ needs_sphinx = '1.3'
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
 extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include', 'cdomain',
-              'kfigure', 'sphinx.ext.ifconfig', 'automarkup']
+              'kfigure', 'sphinx.ext.ifconfig', 'automarkup', 'kernel_abi']
 
 # The name of the math extension changed on Sphinx 1.4
 if (major == 1 and minor > 3) or (major > 1):
-- 
2.21.0

