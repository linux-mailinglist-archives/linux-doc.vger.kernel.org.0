Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FE01F8E58
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 08:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFOGsv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 02:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728462AbgFOGrO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Jun 2020 02:47:14 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 219B9208D5;
        Mon, 15 Jun 2020 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592203632;
        bh=YpsoInZqczjnNenwORS4J/CGQOJkV2n3MqoFDptUmuo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H23WV4qxLsoMqm3j5HnK+E0LcvztblvcFG2vTEN3YSSJwyi8l8zqcrsKxUsS/Jx8V
         oQhwL995MECtciboau6NJkdOPVMMtFxkxd4oFLG8E0QlAabqA4LkJ3FKEE+e3qanQs
         CDK54KF+QpJhdK5jW0aaFWD5YTBh6EQ0hfQAaaA0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkiti-009nnb-3e; Mon, 15 Jun 2020 08:47:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 22/29] docs: it_IT: add two missing references
Date:   Mon, 15 Jun 2020 08:47:01 +0200
Message-Id: <e6ac17a4065a892e1b64e447106178a86354796e.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

there are missing references causing Sphinx warnings:

    Documentation/translations/it_IT/process/submitting-patches.rst:384: WARNING: undefined label: it_email_clients (if the link has no caption the label must precede a section header)
    Documentation/translations/it_IT/process/submitting-patches.rst:384: WARNING: undefined label: it_email_clients (if the link has no caption the label must precede a section header)

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/translations/it_IT/process/management-style.rst   | 2 ++
 Documentation/translations/it_IT/process/submitting-patches.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/translations/it_IT/process/management-style.rst b/Documentation/translations/it_IT/process/management-style.rst
index 76ed074082ea..f7acee105c05 100644
--- a/Documentation/translations/it_IT/process/management-style.rst
+++ b/Documentation/translations/it_IT/process/management-style.rst
@@ -1,5 +1,7 @@
 .. include:: ../disclaimer-ita.rst
 
+.. _it_managementstyle:
+
 :Original: :doc:`../../../process/management-style`
 :Translator: Alessia Mantegazza <amantegazza@vaga.pv.it>
 
diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
index 7c23c08e4401..94c816b4e8f8 100644
--- a/Documentation/translations/it_IT/process/submitting-patches.rst
+++ b/Documentation/translations/it_IT/process/submitting-patches.rst
@@ -1,3 +1,5 @@
+.. _it_email_clients:
+
 .. include:: ../disclaimer-ita.rst
 
 :Original: :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
-- 
2.26.2

