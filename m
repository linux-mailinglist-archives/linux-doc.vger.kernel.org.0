Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CCF363CD2
	for <lists+linux-doc@lfdr.de>; Mon, 19 Apr 2021 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbhDSHih (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Apr 2021 03:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237979AbhDSHif (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:35 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C67C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:38:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id s15so39446255edd.4
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBxjluacdx44Ad2DUdXDx0FetvYAHBA3papJxkIAM7s=;
        b=ElXPKaW5VxqI7pBiBJTX9KZjia9NEbmTGGLXYonGevuIOND6ijttUWkabkwosR65wK
         R9NNkrGkE5Ps9Sp8RJuDB20tdplca/krXFm4VjXalsDLdij3JZPN47qzMu/ilax4FV3k
         h7lvlP59K7DAG+N4ysHfiyMvB4UURrYWdETCkhdiewglwoLfrurB530I2Oa/uzoDBqll
         IExn4YiN8DAgftj34EI9F+85IdSG4wGsArAQmiiiW4w9PJXHSxbBDqvPV373CA5ZNVMI
         7p/ya3OA6JSC1f6JtB9ZDG15BNyKy20mIr92kdY4shMwzSFv8v7BLQcAc+bo94onztvH
         m0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBxjluacdx44Ad2DUdXDx0FetvYAHBA3papJxkIAM7s=;
        b=MvV91R4by/xwi0kwiPvobSeVdJfb9KFDHxMd0vVTwVK+nqRFnOMDEwt+ocsoHrbahj
         6EARpBOcXnJG/p2O3P+lQsag1bfG/EuK8xpmwRZrN9MR1GzRIbFX8g5CAf/xvC3enF3g
         AAyBgfchja1D98vkQHe5WXnG8LPCHxvJLVXTmX6BdG+kqodciKfuI9LfLdVxWLLD0WW3
         ITVD4QeMJwbIWLx3QEgN92uKdXPVLFmSDgsth7BaBtVMP8mFWdXFgqxUxZLiQFh+oEKP
         UJuNNJmnaaQ/i7DQr7sWz3t1dx3Oh+paiL90ajC/oxDbiLV4ms+FT09+gAx+uQCiv+WU
         H6mg==
X-Gm-Message-State: AOAM533okDJKASoreswmbYsz3GbcvzXpKAxnuhkfxXnoYHO/OJmY8IFc
        DZS6HbOsL/JoHt4BaoAnsgjBQw==
X-Google-Smtp-Source: ABdhPJw1DrHlPDDt5k1QBPcSIQfEwEd5Hnl9ujAbb4zsWty9CmI3vFx0vctgcfuIk1YKRqGY31680A==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr16186433edt.276.1618817884985;
        Mon, 19 Apr 2021 00:38:04 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:38:04 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Dima Stepanov <dmitrii.stepanov@cloud.ionos.com>,
        Gioh Kim <gi-oh.kim@ionos.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCHv5 for-next 19/19] block/rnbd: Use strscpy instead of strlcpy
Date:   Mon, 19 Apr 2021 09:37:22 +0200
Message-Id: <20210419073722.15351-20-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Dima Stepanov <dmitrii.stepanov@cloud.ionos.com>

During checkpatch analyzing the following warning message was found:
  WARNING:STRLCPY: Prefer strscpy over strlcpy - see:
  https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Fix it by using strscpy calls instead of strlcpy.

Signed-off-by: Dima Stepanov <dmitrii.stepanov@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Signed-off-by: Gioh Kim <gi-oh.kim@ionos.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/rnbd/rnbd-clt-sysfs.c | 6 +++---
 drivers/block/rnbd/rnbd-clt.c       | 4 ++--
 drivers/block/rnbd/rnbd-srv.c       | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnbd-clt-sysfs.c
index 042566b47bd9..324afdd63a96 100644
--- a/drivers/block/rnbd/rnbd-clt-sysfs.c
+++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
@@ -99,7 +99,7 @@ static int rnbd_clt_parse_map_options(const char *buf, size_t max_path_cnt,
 				kfree(p);
 				goto out;
 			}
-			strlcpy(opt->sessname, p, NAME_MAX);
+			strscpy(opt->sessname, p, NAME_MAX);
 			kfree(p);
 			break;
 
@@ -142,7 +142,7 @@ static int rnbd_clt_parse_map_options(const char *buf, size_t max_path_cnt,
 				kfree(p);
 				goto out;
 			}
-			strlcpy(opt->pathname, p, NAME_MAX);
+			strscpy(opt->pathname, p, NAME_MAX);
 			kfree(p);
 			break;
 
@@ -510,7 +510,7 @@ static int rnbd_clt_get_path_name(struct rnbd_clt_dev *dev, char *buf,
 	int ret;
 	char pathname[NAME_MAX], *s;
 
-	strlcpy(pathname, dev->pathname, sizeof(pathname));
+	strscpy(pathname, dev->pathname, sizeof(pathname));
 	while ((s = strchr(pathname, '/')))
 		s[0] = '!';
 
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 95381e6663e0..c01786afe1b1 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -578,7 +578,7 @@ static int send_msg_open(struct rnbd_clt_dev *dev, enum wait_type wait)
 
 	msg.hdr.type	= cpu_to_le16(RNBD_MSG_OPEN);
 	msg.access_mode	= dev->access_mode;
-	strlcpy(msg.dev_name, dev->pathname, sizeof(msg.dev_name));
+	strscpy(msg.dev_name, dev->pathname, sizeof(msg.dev_name));
 
 	WARN_ON(!rnbd_clt_get_dev(dev));
 	err = send_usr_msg(sess->rtrs, READ, iu,
@@ -800,7 +800,7 @@ static struct rnbd_clt_session *alloc_sess(const char *sessname)
 	sess = kzalloc_node(sizeof(*sess), GFP_KERNEL, NUMA_NO_NODE);
 	if (!sess)
 		return ERR_PTR(-ENOMEM);
-	strlcpy(sess->sessname, sessname, sizeof(sess->sessname));
+	strscpy(sess->sessname, sessname, sizeof(sess->sessname));
 	atomic_set(&sess->busy, 0);
 	mutex_init(&sess->lock);
 	INIT_LIST_HEAD(&sess->devs_list);
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index abacd9ef10d6..899dd9d7c10b 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -298,7 +298,7 @@ static int create_sess(struct rtrs_srv *rtrs)
 	mutex_unlock(&sess_lock);
 
 	srv_sess->rtrs = rtrs;
-	strlcpy(srv_sess->sessname, sessname, sizeof(srv_sess->sessname));
+	strscpy(srv_sess->sessname, sessname, sizeof(srv_sess->sessname));
 
 	rtrs_srv_set_sess_priv(rtrs, srv_sess);
 
@@ -437,7 +437,7 @@ static struct rnbd_srv_dev *rnbd_srv_init_srv_dev(const char *id)
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	strlcpy(dev->id, id, sizeof(dev->id));
+	strscpy(dev->id, id, sizeof(dev->id));
 	kref_init(&dev->kref);
 	INIT_LIST_HEAD(&dev->sess_dev_list);
 	mutex_init(&dev->lock);
@@ -589,7 +589,7 @@ rnbd_srv_create_set_sess_dev(struct rnbd_srv_session *srv_sess,
 
 	kref_init(&sdev->kref);
 
-	strlcpy(sdev->pathname, open_msg->dev_name, sizeof(sdev->pathname));
+	strscpy(sdev->pathname, open_msg->dev_name, sizeof(sdev->pathname));
 
 	sdev->rnbd_dev		= rnbd_dev;
 	sdev->sess		= srv_sess;
-- 
2.25.1

