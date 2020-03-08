Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BFB17D744
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2020 01:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCIAFV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 8 Mar 2020 20:05:21 -0400
Received: from haggis.mythic-beasts.com ([46.235.224.141]:50751 "EHLO
        haggis.mythic-beasts.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgCIAFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Mar 2020 20:05:21 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 20:05:20 EDT
Received: from [146.90.33.204] (port=52712 helo=slartibartfast.quignogs.org.uk)
        by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <peter@bikeshed.quignogs.org.uk>)
        id 1jB5pz-0005Me-BO; Mon, 09 Mar 2020 00:00:03 +0000
From:   peter@bikeshed.quignogs.org.uk
To:     linux-doc@vger.kernel.org
Cc:     Peter Lister <peter@bikeshed.quignogs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/1] Tiny patch to fix doc build warnings
Date:   Sun,  8 Mar 2020 23:59:56 +0000
Message-Id: <20200308235957.9187-1-peter@bikeshed.quignogs.org.uk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Peter Lister <peter@bikeshed.quignogs.org.uk>

Inspired by Jonathan's recent lwn.net article, here's a tiny patch to fix doc
build warnings due to extra double colons.

Peter Lister (1):
  Changed double colon to single colon at the ends of two paragraphs
    preceding ".. code-block:: c".

 Documentation/driver-api/gpio/driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.1

