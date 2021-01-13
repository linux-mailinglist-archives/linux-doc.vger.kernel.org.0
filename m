Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443042F4938
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jan 2021 12:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbhAMLAK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jan 2021 06:00:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:38262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbhAMLAK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:00:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C2FD23159;
        Wed, 13 Jan 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535569;
        bh=zPWcolGCBBiIUcSu9gOwE8Ispr/jLZk/wATleNmUKag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EYnu+v3MeRWCSJDpQuQz+Nfrhk1DR2tsY5f4sYu+OqUsw+iTlAen9CjllGkqwfOei
         adyBFjH5IUeN9qx8SpIvFSpQLxM8osRPspcz4KFYkHbMm3aX3vWU8L/N60pCCBAyxm
         60Pft8ge+MfdhcDRsr6CCWAxSJVEYEMZag7nrBVJg6SaoYZefZqrgrvM2U5aTXjOqN
         DfLXLhXnqfWda5yQe4x5mofEc2o0iu+jdhsSHcHUXN6hBhwWH+HsjA0qnDP96gVQTA
         B4y6/Sf9adZ7Yy1tsuIxtZUool1gfmmMSa6g+8a0beDxD4YJew6F08HAk3cemg8ifg
         KBgnleWT79qAg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpFy-7f; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 05/24] MAINTAINERS: update envelope-detector.yaml reference
Date:   Wed, 13 Jan 2021 11:59:06 +0100
Message-Id: <d416b1831674b2a58c511766a10247685fdc6758.1610535349.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 66a6dcc20e63 ("dt-bindings:iio:adc:envelope-detector: txt to yaml conversion.")
renamed: Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
to: Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ff692445967..a2579cdad3ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8691,7 +8691,7 @@ M:	Peter Rosin <peda@axentia.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-adc-envelope-detector
-F:	Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
+F:	Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml
 F:	drivers/iio/adc/envelope-detector.c
 
 IIO MULTIPLEXER
-- 
2.29.2

