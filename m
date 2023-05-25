Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A861C710EB9
	for <lists+linux-doc@lfdr.de>; Thu, 25 May 2023 16:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241718AbjEYOzW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 May 2023 10:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240727AbjEYOzN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 10:55:13 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7014C18D;
        Thu, 25 May 2023 07:55:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso5432995e9.3;
        Thu, 25 May 2023 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685026499; x=1687618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMFIVEMdnhDK+r9aZC4DEh7b5Mu4DnfdJk/ks7MSEOs=;
        b=mI+0fiQQqtsQBJm7KXX3R4+bCHCa6vTlfiZxJzVyGrbn+lOUAtQxwBBtnySJM5xy9D
         +Zv8ScZK4SPcxkwKCs7rWGCZUTn9efzMQg6oRD4KNXb1BBESjr/5f3lOgPoKFcwBLEwE
         Hnu98WF/YCSgGbQJnXUrgHwlHyy6H+ASPU6j0FfrtHGdih/2e9C+j6ExZhF0NflasIjb
         f2xFNPJjQGCsDQ0kQIKvoibtozpN4UCkNbYwtxwtTSRbmeytq/I+XBF7neWW+WVrjdCZ
         9Jwa9MHJQ+z1TRudrebUkgO8QbB3xuUBY/uQuVpHH16Mi5ivQb9856OMrbRjgBeMjfJg
         eTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685026499; x=1687618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMFIVEMdnhDK+r9aZC4DEh7b5Mu4DnfdJk/ks7MSEOs=;
        b=cZvOAmfKgdfvaUIT9peiDelbPtl8ukOiYdg4E4PN8pdY03+qioZytB1F9IVCJQa9CY
         mFgm6fML/ryQ/PXuOA7jP48dSOSKNBd7MzWxKwut6wbR8TqmRW7XypKDpsjbzvevox1c
         PQozKvFm0MrVyInGWlmSVzJL4W7wSUvirXTzxVpikN2lHnrOsSdKGusvzVMbXcXikKF9
         3+s1PggY7SiaN8RmFnkz+rVBa1V9k+d1cXLBa/U+QwjZr5dKYO8jbDT0P9BdR3u3Ad6G
         OEuGqAXTdkNAgDCXnyh7lq1XDjve3bxdDVuRB9/Om1uW7FgzCPdVeZcvAdRvTPOfoDJH
         ODZQ==
X-Gm-Message-State: AC+VfDzDMvZ9/SjXD8GWebrwsV1ynaMUPphtegvtvTv5C6FlLCigcCH6
        G+g6A3r1A1idfg2auAfFIIc=
X-Google-Smtp-Source: ACHHUZ7IQ0Cpd1ZyXrl5/2lcJ/959rFbvu2cNfFqg4oEeT1iov7cZBG8Kn+l271onXjvdg+sEwD7Mg==
X-Received: by 2002:adf:eb8d:0:b0:30a:a440:46ec with SMTP id t13-20020adfeb8d000000b0030aa44046ecmr2876693wrn.8.1685026498759;
        Thu, 25 May 2023 07:54:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.googlemail.com with ESMTPSA id t11-20020a5d49cb000000b0030732d6e104sm2048043wrs.105.2023.05.25.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 07:54:58 -0700 (PDT)
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [net-next PATCH v2 07/13] leds: trigger: netdev: reject interval store for hw_control
Date:   Thu, 25 May 2023 16:53:55 +0200
Message-Id: <20230525145401.27007-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525145401.27007-1-ansuelsmth@gmail.com>
References: <20230525145401.27007-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reject interval store with hw_control enabled. It's are currently not
supported and MUST be set to the default value with hw control enabled.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 2101cbbda707..cb2ec33abc4e 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -265,6 +265,9 @@ static ssize_t interval_store(struct device *dev,
 	unsigned long value;
 	int ret;
 
+	if (trigger_data->hw_control)
+		return -EINVAL;
+
 	ret = kstrtoul(buf, 0, &value);
 	if (ret)
 		return ret;
-- 
2.39.2

