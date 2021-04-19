Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74467363CAF
	for <lists+linux-doc@lfdr.de>; Mon, 19 Apr 2021 09:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237889AbhDSHiW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Apr 2021 03:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbhDSHiW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95424C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:52 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r9so51346444ejj.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dUT1GNhkzIs4KMdUcaLBHxt9noYnFY4GBGwC4fHfsvc=;
        b=G+CAe+mp/UZxfpzla5tOiIlJBMCGAWqXpP0jSZTsLdJNvNpa6O1NICruhkQvM1WXcq
         xoYCsmclOw5BAfbPWKPzKbzpABi22dELgwMATD304QJ8gSGtXZY9FnPg9AFBOP3anIod
         11IcDSR1EgJSmTC99Pf1ZsXPfgsafrVhV4iDxZOP/u3ungbJ9GhC0XS8HAtJedW7j6Av
         BycyZ74YV7xBDiz62rK/V8gDbTje/X2WOLr5n532BY+9D7v8QrE/godkd2reYoWbxyb3
         lsA+g6rBdZUaG8AOmZjm1Ko7BrgIWJbjBLkNQr+Fv4boTCIliGNxDf7SOLZm3IfQFSPU
         NMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dUT1GNhkzIs4KMdUcaLBHxt9noYnFY4GBGwC4fHfsvc=;
        b=Bmi/jeOubNaV6qieX4J1KKg6h58xNLAKMI9jlMoBpDD7A5hNSyVToiGYDfr29l41my
         L1W189GkXJiulzncWNDPs+hnrLegZls/QqcJH/JL0UztfPeLkI/ncKvVVHnmJqgQdLjY
         nCWuzLyEwo6bchpOEYc8sxzIUYd7MKQFqVkdU0njce8EMl5vAao7cwFN30yKNMw1X2BS
         fSWNG5gq2TBYJjsXFo7SlfJSxhupqCRgAgTmFojPVxc0Na1OCm5li2nNBxsMlnHC5C/0
         3QmEWXZKcubuaIpLyD6w1fjEFZ6P6IKpRbVf3STzrfo75Y6Ej8Woo+CDrV/8HAQS0gwM
         gEpQ==
X-Gm-Message-State: AOAM533qOdUr5XKzEp6HhTPDleEMIjvckpfknXmW/O/zr/hfV8Imzy+B
        CJ9kOYa1LX0mq08zDLfx0vpd0g==
X-Google-Smtp-Source: ABdhPJxVHqjmKCBWJWzjmrjS2Qxxe7MwbOrL5xjApJuxS8oA5s2NIA4ShDaeUY0s24q9AMxP7VFdhw==
X-Received: by 2002:a17:906:b118:: with SMTP id u24mr20734540ejy.331.1618817871401;
        Mon, 19 Apr 2021 00:37:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:51 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Guoqing Jiang <guoqing.jiang@gmx.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCHv5 for-next 04/19] block/rnbd-clt: Remove some arguments from rnbd_client_setup_device
Date:   Mon, 19 Apr 2021 09:37:07 +0200
Message-Id: <20210419073722.15351-5-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guoqing Jiang <guoqing.jiang@gmx.com>

Remove them since both sess and idx can be dereferenced from dev. And
sess is not used in the function.

Signed-off-by: Guoqing Jiang <guoqing.jiang@gmx.com>
Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/rnbd/rnbd-clt.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 5a5c8dea38dc..ecb83c10013d 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1354,10 +1354,9 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, dev->queue);
 }
 
-static int rnbd_client_setup_device(struct rnbd_clt_session *sess,
-				     struct rnbd_clt_dev *dev, int idx)
+static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
 {
-	int err;
+	int err, idx = dev->clt_device_id;
 
 	dev->size = dev->nsectors * dev->logical_block_size;
 
@@ -1535,7 +1534,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
 	mutex_lock(&dev->lock);
 	pr_debug("Opened remote device: session=%s, path='%s'\n",
 		 sess->sessname, pathname);
-	ret = rnbd_client_setup_device(sess, dev, dev->clt_device_id);
+	ret = rnbd_client_setup_device(dev);
 	if (ret) {
 		rnbd_clt_err(dev,
 			      "map_device: Failed to configure device, err: %d\n",
-- 
2.25.1

