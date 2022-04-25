Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090B250D69A
	for <lists+linux-doc@lfdr.de>; Mon, 25 Apr 2022 03:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240173AbiDYBhz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Apr 2022 21:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240178AbiDYBha (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:37:30 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F700EE987
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650850467; x=1682386467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d9PnIoUQA+w0BwKcbtVShR1kDth5oR1vKirt4inS49A=;
  b=nkOC2Hld5MAg87UtefxrK+dWkL4TR5Sj8CVXMNcbQyy1xatbzuWIb9DB
   L3l8bJi91CK2rqw3Cyhk9jYzCaJMLK6y8gJ81Bg47BW1R1eQq4k6x3rfh
   41PxO9MzdVRMLDfNvrTe0r/OmAU6FpSviaHbJnzZgODPfOSnHU/rWdNlP
   vbAf7ld41BMl1Twnwmg2pR705vy9Mi8H3w8+OlaYWj4EMmrhtqRekBSRJ
   YftAFYErnCpIvWO9QN2buwFWMzfr60ep6zSaLghPr+OcQazXjcLTZSeQY
   cEnqTXNhpsEI1Oa7tPXDzjzck2NHBHVpfxmcn2sbJkmFSwIh38hrs078O
   w==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="302917797"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:34:25 +0800
IronPort-SDR: Jp4p8672TECKB7fndn9A4unWApWPI4wMTMmOXZuHIW7FXVFM2bXHbu97CsGoyCWI+myU7n6CKf
 SeiBwjw7r6uj20lnjUFUFbxQWVMN/jKIGgBwTE7rGP1rag3e6Rwr5jqMix0CMNc2MJYolNelU8
 xW8uN80lrM60mRKKSYC4qpBcgHsXYTHEJDzW2WSka32Jrei/v52buyyq3HsZ+nah8qXTp+jLIb
 vx1MOVM9Vu6mOx49TXe/m729nQ6M3KwP0ZeuKJGueX/xXqvyayZGAki7sYZXv1PJlS6uAa6Q+t
 cxlrJ2w7GstJvJDGsYhJ4GPy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:05:22 -0700
IronPort-SDR: fbqSUr2EN9hvlQCw9luxh8mxRNAf67cdUqyjdRclryVPAUVnTfgs+vEW0OejiTwP86ZnUwA30z
 HxLcKw1zNiARRuXRKEZBs99yQ/pmHkDJYQaNZXliAEHSx5Bhlh3nTxQV6rOP+iX2iQjSltPtG2
 YAtZXTgUaym4qngcQTGig2A9987djlTCzdzTYKhGuiE5daJ/W0q6ZkjkMTqrRIIyfcOR0qkfEQ
 wWarSRjB3KUv1v+7RIYwIjVpLRsyMOX+LkPNpGxEDLxepf13Cd/GQ//6m8toteJUK+Vq0ywAMG
 jyY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:34:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KmncK0Pd1z1SVp0
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1650850464; x=1653442465; bh=d9PnIoUQA+w0BwKcbt
        VShR1kDth5oR1vKirt4inS49A=; b=q3w6szy/xc+Uksn40s6AmaYANNJiADEmSG
        aZx7uuIJqCZ+UkD1sytvwPsmS0q7gFH1gogS28AIt0VoBfFNkU7JR1+MsRtD7E+8
        9pBjSAMHMO+zBSJbFrsnAznRrCz5PI5b2Xmq0S7AZtSWQ35lr1EqUr2bRURFuNj2
        rJXw2xcEus/Cbfntp7uJE5gkHSxW47fqkkxh+KxNpm2+dDqO7Sw6l8ZowXU2qTYt
        pLUd8LSdCvFI4fyhCdF8KnWraQHxzIUEipTIG5VSe7ex+1TRJRCvIyToT6BvrHWc
        3VQ2etp1+vwukv+yUa1He/rnTHj9Fa4Fwx1jLvjLX5cWhWKMDUxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id JnPUrxS_9XuF for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:34:24 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KmncH693Sz1Rvlx;
        Sun, 24 Apr 2022 18:34:23 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 4/5] ata: libata-core: Allow forcing most horkage flags
Date:   Mon, 25 Apr 2022 10:34:16 +0900
Message-Id: <20220425013417.3947791-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
References: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To facilitate debugging of drive issues in the field without kernel
changes (e.g. temporary test patches), add an entry for most horkage
flags in the force_tbl array to allow controlling these horkage
settings with the libata.force kernel boot parameter.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/libata-core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index e5a0e73b39d3..f68cb5639ec4 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6230,9 +6230,27 @@ static const struct ata_force_param force_tbl[] __=
initconst =3D {
 	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
 	force_horkage_onoff(ncqati,	ATA_HORKAGE_NO_NCQ_ON_ATI),
=20
-	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
+	force_horkage_onoff(trim,	ATA_HORKAGE_NOTRIM),
+	force_horkage_on(trim_zero,	ATA_HORKAGE_ZERO_AFTER_TRIM),
+	force_horkage_on(max_trim_128m, ATA_HORKAGE_MAX_TRIM_128M),
+
+	force_horkage_onoff(dma,	ATA_HORKAGE_NODMA),
 	force_horkage_on(atapi_dmadir,	ATA_HORKAGE_ATAPI_DMADIR),
-	force_horkage_on(disable,	ATA_HORKAGE_DISABLE)
+	force_horkage_on(atapi_mod16_dma, ATA_HORKAGE_ATAPI_MOD16_DMA),
+
+	force_horkage_onoff(dmalog,	ATA_HORKAGE_NO_DMA_LOG),
+	force_horkage_onoff(iddevlog,	ATA_HORKAGE_NO_ID_DEV_LOG),
+	force_horkage_onoff(logdir,	ATA_HORKAGE_NO_LOG_DIR),
+
+	force_horkage_on(max_sec_128,	ATA_HORKAGE_MAX_SEC_128),
+	force_horkage_on(max_sec_1024,	ATA_HORKAGE_MAX_SEC_1024),
+	force_horkage_on(max_sec_lba48,	ATA_HORKAGE_MAX_SEC_LBA48),
+
+	force_horkage_onoff(lpm,	ATA_HORKAGE_NOLPM),
+	force_horkage_onoff(setxfer,	ATA_HORKAGE_NOSETXFER),
+	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
+
+	force_horkage_on(disable,	ATA_HORKAGE_DISABLE),
 };
=20
 static int __init ata_parse_force_one(char **cur,
--=20
2.35.1

