Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41ACE148FDD
	for <lists+linux-doc@lfdr.de>; Fri, 24 Jan 2020 22:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAXVB3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Jan 2020 16:01:29 -0500
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:39674 "EHLO
        1.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729799AbgAXVB3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jan 2020 16:01:29 -0500
X-Greylist: delayed 4199 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Jan 2020 16:01:29 EST
Received: from player774.ha.ovh.net (unknown [10.108.57.245])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id E652E157CFC
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2020 19:33:36 +0100 (CET)
Received: from sk2.org (unknown [77.240.182.90])
        (Authenticated sender: steve@sk2.org)
        by player774.ha.ovh.net (Postfix) with ESMTPSA id F1711EAF5EA7;
        Fri, 24 Jan 2020 18:33:31 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] Allow git builds of Sphinx
Date:   Fri, 24 Jan 2020 19:33:16 +0100
Message-Id: <20200124183316.1719218-1-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4071254064175140255
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrvdeggdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpjeejrddvgedtrddukedvrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When using a non-release version of Sphinx, from a local build (with
improvements for kernel doc handling, why not),

	sphinx-build --version

reports versions of the form

	sphinx-build 3.0.0+/4703d9119972

i.e. base version, a plus symbol, slash, and the start of the git hash
of whatever repository the command is run in (no, not the hash that
was used to build Sphinx!).

This patch fixes the installation check in sphinx-pre-install to
recognise such version output.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 scripts/sphinx-pre-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 470ccfe678aa..a8f0c002a340 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -272,7 +272,7 @@ sub check_sphinx()
 
 	open IN, "$sphinx --version 2>&1 |" or die "$sphinx returned an error";
 	while (<IN>) {
-		if (m/^\s*sphinx-build\s+([\d\.]+)$/) {
+		if (m/^\s*sphinx-build\s+([\d\.]+)(\+\/[\da-f]+)?$/) {
 			$cur_version=$1;
 			last;
 		}
-- 
2.24.1

