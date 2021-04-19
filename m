Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94533363CB6
	for <lists+linux-doc@lfdr.de>; Mon, 19 Apr 2021 09:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237785AbhDSHiZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Apr 2021 03:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbhDSHiZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:25 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A69C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r9so51346603ejj.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UV5euG+BoTE43f7Ueiuj3a/UPU6dlpNgwx7fSpiSFBs=;
        b=dCV4Y9Fw2A8c6eMnrZEyj0ZIdwZXrtdzpG+3YcKb33x8GYf9/95plbzZmTMGVTw+J5
         02UlMoluZOmPXnjGZLrVs97Djs62m3/VNovcRfLEWmISwlEn2qlMFUd2txmtAVJdOSzl
         DjkC2blGIDh/8mYnsgl6G/amuNz/Igm9UMm6gm4UmzAcHfIuQpPEM/IoubplSwbyOv1b
         1VzMdONECPy2JPoj9NgqgnUhEdjsSwKitkAaHb82+It7q13z1GRMudJvV1nHpHsXgW6L
         LHKfJevZKlaImN6MfRsx2eSFrsi1FCRLmrw+42p0rbOebatNwvoZkSghGm4cCo3q0Q4D
         ovHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UV5euG+BoTE43f7Ueiuj3a/UPU6dlpNgwx7fSpiSFBs=;
        b=A5Ysie3Mmx4DlZRdjUkfCeQTD47zVUOrFYTApE+daZFO/Fqo5sfsDJ29kYD7fAwdWs
         FgJImaZX2wr/BJKGy8fzaUiP+AEMlyQAAqrEBJUEDkkeDGSOdWzJNuLbfxYl0gjhsNHo
         1PZrsnUrqsREFtJ9u7h1H/sbbCBAr+DwY6QT86oMIALyaaBdVwdkN9HI/FA0MaJ4uGBM
         15TwxQtCjkVpCDTe3usQRviOBRsXeMkTf/onadjHGmyqS5OcmHbOlxcZ98Pjo9KBNp88
         OKAWyGyp9VgGEK9uk/XNzYIZHcti++6GNH/oHxo8Q1E+sVSiLk0PBO0VoWhrAQW6P/YW
         JcBg==
X-Gm-Message-State: AOAM533W/5gvTf1Ryfy+mFdcnYw4spo3H8NB472PR07oTSDJxJxLcXPT
        DdUPxQi8l1coGOjYaEOsV8ClVQ==
X-Google-Smtp-Source: ABdhPJx5CLN4jDnVYk7xYqQAdF0uN2HdD3BE/7NXFhH60t5q+Y7YEjN41Bi3l4Cx+UWXrxulQb5PxQ==
X-Received: by 2002:a17:906:49d3:: with SMTP id w19mr20706452ejv.116.1618817873964;
        Mon, 19 Apr 2021 00:37:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:53 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Guoqing Jiang <guoqing.jiang@ionos.com>,
        Danil Kipnis <danil.kipnis@ionos.com>,
        Gioh Kim <gi-oh.kim@ionos.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCHv5 for-next 07/19] block/rnbd: Kill destroy_device_cb
Date:   Mon, 19 Apr 2021 09:37:10 +0200
Message-Id: <20210419073722.15351-8-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>

We can use destroy_device directly since destroy_device_cb is just the
wrapper of destroy_device.

Signed-off-by: Guoqing Jiang <guoqing.jiang@ionos.com>
Reviewed-by: Danil Kipnis <danil.kipnis@ionos.com>
Signed-off-by: Gioh Kim <gi-oh.kim@ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/rnbd/rnbd-srv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index a6a68d44f517..a4fd9f167c18 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -178,8 +178,10 @@ static int process_rdma(struct rtrs_srv *sess,
 	return err;
 }
 
-static void destroy_device(struct rnbd_srv_dev *dev)
+static void destroy_device(struct kref *kref)
 {
+	struct rnbd_srv_dev *dev = container_of(kref, struct rnbd_srv_dev, kref);
+
 	WARN_ONCE(!list_empty(&dev->sess_dev_list),
 		  "Device %s is being destroyed but still in use!\n",
 		  dev->id);
@@ -198,18 +200,9 @@ static void destroy_device(struct rnbd_srv_dev *dev)
 		kfree(dev);
 }
 
-static void destroy_device_cb(struct kref *kref)
-{
-	struct rnbd_srv_dev *dev;
-
-	dev = container_of(kref, struct rnbd_srv_dev, kref);
-
-	destroy_device(dev);
-}
-
 static void rnbd_put_srv_dev(struct rnbd_srv_dev *dev)
 {
-	kref_put(&dev->kref, destroy_device_cb);
+	kref_put(&dev->kref, destroy_device);
 }
 
 void rnbd_destroy_sess_dev(struct rnbd_srv_sess_dev *sess_dev, bool keep_id)
-- 
2.25.1

