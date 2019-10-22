Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511A1E0CEF
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2019 21:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbfJVT6l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Oct 2019 15:58:41 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:43800 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVT6l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 15:58:41 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46yPTC2jGpz1rGS1;
        Tue, 22 Oct 2019 21:58:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46yPTC2T0Bz1qqkG;
        Tue, 22 Oct 2019 21:58:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 4G7lM95IUvTH; Tue, 22 Oct 2019 21:58:38 +0200 (CEST)
X-Auth-Info: Q3F6pPVB3LuBbOmN3i9N/jCUoRNR8CaWtbjp8LlS2Ks=
Received: from sandvich.home (pD9FFA4DF.dip0.t-ipconnect.de [217.255.164.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 22 Oct 2019 21:58:38 +0200 (CEST)
From:   Harald Seiler <hws@denx.de>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Harald Seiler <hws@denx.de>
Subject: [PATCH] docs: driver-api: Remove reference to sgi-ioc4
Date:   Tue, 22 Oct 2019 21:57:48 +0200
Message-Id: <20191022195747.226104-1-hws@denx.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit f7bc6e42bf12 ("drivers: remove the SGI SN2 IOC4 base support")
removed support for SGI SN2 IOC4 and the relevant documentation files.
Remove a leftover reference in the toctree of the driver-api
documentation to fix this sphinx error:

    Documentation/driver-api/index.rst:14: WARNING: toctree contains
        reference to nonexisting document 'driver-api/sgi-ioc4'

Signed-off-by: Harald Seiler <hws@denx.de>
---
 Documentation/driver-api/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index c1e1b3f6d419..46d6a165b5a5 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -92,7 +92,6 @@ available subsections can be seen below.
    pwm
    rfkill
    serial/index
-   sgi-ioc4
    sm501
    smsc_ece1099
    switchtec
-- 
2.23.0

