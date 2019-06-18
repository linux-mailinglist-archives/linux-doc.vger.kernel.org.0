Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC3D4AC63
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2019 22:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbfFRUzz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Jun 2019 16:55:55 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50364 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730664AbfFRUxy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jun 2019 16:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XybHKlaRWzbSGlu8K7TS9Q7Y/OmFmTKD4x+hIonIz/Y=; b=AH1QL9su9j33iAlK1EfQgsnpDO
        p5MhFn3lV3uPKIt7bUIcmXhpt70U0LraZ6PZEN6G4QlStjVuZULgkx3zc7twSFMNxAy/MA+1RI91/
        x1/jKn1yizJn7+qwkhbPa3vZ48Cmm/QjpW2LGYp7uIzRNhcMjcYMpae8UPq5tsfwPQPOcNIjhrWs7
        gMvDVY19d3e2wPLlcDnI3fkTef5eQ2hba6IzQ0ka/kW7Th/pHkVh1OtJ3D5SrIWEilm984JFpxru1
        mqdaGRcOe7qKSu7N/DwNkFOnZuqCmHAvF5jCHgmJoDpQav9J4pTvFtAzfEfZxYlEW3AXkENI6y3gX
        7aCdgbhg==;
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdL73-0008N1-Lr; Tue, 18 Jun 2019 20:53:53 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hdL70-00020L-92; Tue, 18 Jun 2019 17:53:50 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 23/29] docs: namespaces: convert to ReST
Date:   Tue, 18 Jun 2019 17:53:41 -0300
Message-Id: <0de1606d1bba4da4e555477b10217877a0c9b1d7.1560890801.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560890800.git.mchehab+samsung@kernel.org>
References: <cover.1560890800.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rename the namespaces documentation files to ReST, add an
index for them and adjust in order to produce a nice html
output via the Sphinx build system.

There are two upper case file names. Rename them to
lower case, as we're working to avoid upper case file
names at Documentation.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 ...{compatibility-list.txt => compatibility-list.rst} | 10 +++++++---
 Documentation/namespaces/index.rst                    | 11 +++++++++++
 .../{resource-control.txt => resource-control.rst}    |  4 ++++
 3 files changed, 22 insertions(+), 3 deletions(-)
 rename Documentation/namespaces/{compatibility-list.txt => compatibility-list.rst} (86%)
 create mode 100644 Documentation/namespaces/index.rst
 rename Documentation/namespaces/{resource-control.txt => resource-control.rst} (89%)

diff --git a/Documentation/namespaces/compatibility-list.txt b/Documentation/namespaces/compatibility-list.rst
similarity index 86%
rename from Documentation/namespaces/compatibility-list.txt
rename to Documentation/namespaces/compatibility-list.rst
index defc5589bfcd..318800b2a943 100644
--- a/Documentation/namespaces/compatibility-list.txt
+++ b/Documentation/namespaces/compatibility-list.rst
@@ -1,4 +1,6 @@
-	Namespaces compatibility list
+=============================
+Namespaces compatibility list
+=============================
 
 This document contains the information about the problems user
 may have when creating tasks living in different namespaces.
@@ -7,13 +9,16 @@ Here's the summary. This matrix shows the known problems, that
 occur when tasks share some namespace (the columns) while living
 in different other namespaces (the rows):
 
-	UTS	IPC	VFS	PID	User	Net
+====	===	===	===	===	====	===
+-	UTS	IPC	VFS	PID	User	Net
+====	===	===	===	===	====	===
 UTS	 X
 IPC		 X	 1
 VFS			 X
 PID		 1	 1	 X
 User		 2	 2		 X
 Net						 X
+====	===	===	===	===	====	===
 
 1. Both the IPC and the PID namespaces provide IDs to address
    object inside the kernel. E.g. semaphore with IPCID or
@@ -36,4 +41,3 @@ Net						 X
    even having equal UIDs.
 
    But currently this is not so.
-
diff --git a/Documentation/namespaces/index.rst b/Documentation/namespaces/index.rst
new file mode 100644
index 000000000000..bf40625dd11a
--- /dev/null
+++ b/Documentation/namespaces/index.rst
@@ -0,0 +1,11 @@
+:orphan:
+
+==========
+Namespaces
+==========
+
+.. toctree::
+   :maxdepth: 1
+
+   compatibility-list
+   resource-control
diff --git a/Documentation/namespaces/resource-control.txt b/Documentation/namespaces/resource-control.rst
similarity index 89%
rename from Documentation/namespaces/resource-control.txt
rename to Documentation/namespaces/resource-control.rst
index abc13c394738..369556e00f0c 100644
--- a/Documentation/namespaces/resource-control.txt
+++ b/Documentation/namespaces/resource-control.rst
@@ -1,3 +1,7 @@
+===========================
+Namespaces research control
+===========================
+
 There are a lot of kinds of objects in the kernel that don't have
 individual limits or that have limits that are ineffective when a set
 of processes is allowed to switch user ids.  With user namespaces
-- 
2.21.0

