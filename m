Return-Path: <linux-doc+bounces-767-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AE7D2408
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 17:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B1E1C208C5
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 15:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA45610967;
	Sun, 22 Oct 2023 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5zQfOlo"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF76133
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 15:59:49 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B77F114;
	Sun, 22 Oct 2023 08:59:46 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27d11401516so1513937a91.2;
        Sun, 22 Oct 2023 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697990386; x=1698595186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xxQKEodFUC2UYpxBtN41G4Sz/0EyYclYrrqI5vOMt18=;
        b=V5zQfOlo44tY+NPr2AM+vlytsmhdOCqTBlbjjL+ofvtNDwakB8CHFmu3fiexprzif9
         g/VeB+fRmXYDPIYDhFpLwrciUYB4UUybXGQlwMJS9ZQiNm46MF9xR0A5U7W0a5bKUbMq
         MEYpN3kWeNKFjzEqgS4UK5L0HuHy9/IWQnPQmBLegC59EiwLQ1fjZhjPW4GawYHfaOOW
         SC1QN9yhtMSszmteAtd7YU+Ehbt5Uf00t+7VBeLXCO9j5txtZ9M2iIZhC782K55tsdX1
         2WClA4XxZxFIEKjpjdbawBiZefgb3NwXPnAV4ecSK2Krc/h4xjU5aX2hib9XwVatDbVK
         bQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697990386; x=1698595186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxQKEodFUC2UYpxBtN41G4Sz/0EyYclYrrqI5vOMt18=;
        b=NXofEYkqhm1hI4A8dvMstX6oD0Jq0hP7YH0Dj+0YAzDUFJZtDUY9+MQuRo7CpdHuW+
         z01OzS5eRyklMy4ykxKlAKuzJ5YB571UCD2ju623GCOCJlVRcd+KyvZLNgDXNn4BLiVY
         F0IPKcE9Tbo0cO1RwqhEEPGBRzeffy20UjLV/Dl9quQCvDaYN51zLNT7UcTFT3k4NttM
         BEDXyMft9BjhOoUVU5MQJ/Fb624m1NwHhmkCbuZtNtUOTAWtpPHZyk+tX7zULLO47VoP
         6AZR/yiVtBKHNBCYNErjCzCCAfsnHpISEobVBF9JSSbLUnm5ZhfqCUjxBHowzyrB+64S
         LlNA==
X-Gm-Message-State: AOJu0YwEa5Lx5jMfV0GRydqeWWYLC9ctrcWfoeOPhF2X3WRmJMTbEH8u
	YnUd9Xll1tXh/5rJ4VXkQOs=
X-Google-Smtp-Source: AGHT+IHewF73oZF+C8TEpweLYAh8tOLEqplE4stxNP04YW7z2wmSGwNpqbCfTND/ABr9AEaS9mopaw==
X-Received: by 2002:a17:90b:2b46:b0:27d:882f:e6c5 with SMTP id rr6-20020a17090b2b4600b0027d882fe6c5mr5205780pjb.9.1697990385395;
        Sun, 22 Oct 2023 08:59:45 -0700 (PDT)
Received: from Osmten.. ([103.84.150.66])
        by smtp.gmail.com with ESMTPSA id pw4-20020a17090b278400b0026f4bb8b2casm6287483pjb.6.2023.10.22.08.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 08:59:45 -0700 (PDT)
From: Osama Muhammad <osmtendev@gmail.com>
To: corbet@lwn.net
Cc: samuel.thibault@ens-lyon.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Osama Muhammad <osmtendev@gmail.com>,
	Mushahid Hussain <mushi.shar@gmail.com>
Subject: [PATCH] Documentation: speakup: Update speakup docs
Date: Sun, 22 Oct 2023 20:58:53 +0500
Message-Id: <20231022155853.16061-1-osmtendev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the line which is no longer true speakup
supports USB connections now.

Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
Signed-off-by: Mushahid Hussain <mushi.shar@gmail.com>
---
 Documentation/admin-guide/spkguide.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/spkguide.txt b/Documentation/admin-guide/spkguide.txt
index 74ea7f391942..019dc8bc2a05 100644
--- a/Documentation/admin-guide/spkguide.txt
+++ b/Documentation/admin-guide/spkguide.txt
@@ -83,8 +83,7 @@ spkout -- Speak Out
 txprt -- Transport
 dummy -- Plain text terminal
 
-Note: Speakup does * NOT * support usb connections!  Speakup also does *
-NOT * support the internal Tripletalk!
+Note: Speakup does * NOT * support the internal Tripletalk!
 
 Speakup does support two other synthesizers, but because they work in
 conjunction with other software, they must be loaded as modules after
-- 
2.34.1


