Return-Path: <linux-doc+bounces-40082-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C18A54713
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 10:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A23C167943
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F293720D4E8;
	Thu,  6 Mar 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Hjzwn3Kj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF220C47C
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255046; cv=none; b=rcoU3+Z//HWkfd4KsK+VMiVHeJUKfRdm6Y8faQsoMCweFzVEEvw8RH2g/n+wMDNfzhYqTV/P9YP38hwctBQKz7s9r5Gg03nEAYVA1wVXz5yrEWmiLG4UP7JGJ83cpkaZtP/XyLXf6IHqF4Fp10Qi4NUeMDlYyhV+4atrMg4WHdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255046; c=relaxed/simple;
	bh=nEE2/C77oF+j3LxMBPOVoqrwqXRBAnjdJN3gCt7XvfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=B/cKRpph+Ne5I/h3q5/X9zx/7J6wPoGP04Jj+bJfIiAbvAem57Xg/6JKJuo5p1wK0Sdc4d8wjCjq6CjYs9eAgAE4yyTk84Ijhyn0pi7dQgG+Qo5h8Xs6EFmRY5LiPP25cWFTB/+z4fB11fPsULtkiw+W4pVZytm2eqFWMTJYOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Hjzwn3Kj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso8048745ad.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 01:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741255044; x=1741859844; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/24Tf2dJCQDhe+eHaFoVGEomrBLp8dkxojt6Qs+7G8=;
        b=Hjzwn3KjYw8Eou3QnNb6xowZIEmBUupqNIClkt/HBVzUdsnhmJnIXlyjcGNhs5m5Ga
         0I/Dfr7IKdHMR77f4VWw8qtuiYq7RW4WCqyeXMN/x1wt6CaYL2tWsn2FRV9uU2xbfLRG
         s6cN4pZwOF7NJZ90XsIGlOM5Xnhz5nbobFyrgtdbvPYb6T2nAwRELsJe85ksNGH057yD
         FY+FyHmlpWYnG0QxEDpECDbYnzZ1sdquLrRHTtbGu6VzCW+OB2ZaBlCh0LytB8+HOjOH
         OZzOpllSPib8iVsJKVmIEcZ4tQ+PHK9QLUpTXWShCbWYdSaJIYIQzimpxctJSjPoPlUD
         QlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255044; x=1741859844;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/24Tf2dJCQDhe+eHaFoVGEomrBLp8dkxojt6Qs+7G8=;
        b=W+wCHTwFnAEhKrb1h9CX5vVbtQ8+snDhGNgmHiO0ftNdBmeJsfiRxKNfnT+bcJa7nr
         gMgjdm9mRdyjTMCQ/MsoxavX1b3J6TyvzY+dCxuRb8Ijcs7yzxd6Ouw6E3nodRSncarI
         HCuB6popKohg01BgPDG/bFilIIfaYprtsfrmm7niZnibISefVkU+LLqxy2TSTryF7AL4
         ma/2FrLoJexA4Vl7VLHyLhtAGB4LLOtfGhAd9YfpfgZ9cwRuzT7dhMTa+81Za7RTLcDF
         DbDA87jQ0ChPeNAon2u7AUix9uBxHoFc8WyO39cX15RMPj8zJkqD84s4Xdkt4Pl+QtOf
         ZP5g==
X-Forwarded-Encrypted: i=1; AJvYcCU1TVDOXMypyKOFgaWS79Qq0o9bzjC43CCuWluayx838VWOshRJRVoHV82Jq+N8qdx6kJItz+6E8rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaeeTdYOLpnAezokYPNroRrmlI+1/r6pxzUMysQpO3cApWpIQl
	CQMDxikJ/XUvCKjEupsrwwfoDj0HpEQhRzmvCDErQx94h1zVpn4l5i+NDmG/cY4=
X-Gm-Gg: ASbGncsQoXrS4xnHzVrh3JiOO104XbR+uKCmtrUGmygFNG/aCvpOPID797GQU6edztt
	W/Evsl6uKSsj8kEcJJJidmG95j7HuZi4xnnB7lrcYiE6XZjBI1SfA3fv/S/fzI3zdAbHHkmrIh2
	bMbpBQz+Lw/zNmOAJNYH53hqoqpVFD2+f2zJjIvkFG0ymtxBEz18Onhvw4LJd7T7pwF2SF2d1BN
	hnRr6Ko6FUbmS6KCfVZJasXDDIOeRytd/ijkg6doViSNFHHYtGalQiswHZ1lLEmRO+iYd+FnU7A
	JbM2p68nySKC3Gwfdz9wJ5hupkxxAqMUfPe+t5KBIvl6P4gx
X-Google-Smtp-Source: AGHT+IF8DbatJk1Q6ANosIF8NkNqX8HFE0PqKk+dfYmnjOrPC/QDLXisFNDJhmMcDSA8YlhDXsU1RQ==
X-Received: by 2002:a17:902:ea03:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22409426beemr42036455ad.14.1741255043950;
        Thu, 06 Mar 2025 01:57:23 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736985387d3sm943032b3a.172.2025.03.06.01.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:57:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 06 Mar 2025 18:56:34 +0900
Subject: [PATCH net-next v8 4/6] selftest: tun: Test vnet ioctls without
 device
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-rss-v8-4-7ab4f56ff423@daynix.com>
References: <20250306-rss-v8-0-7ab4f56ff423@daynix.com>
In-Reply-To: <20250306-rss-v8-0-7ab4f56ff423@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

Ensure that vnet ioctls result in EBADFD when the underlying device is
deleted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/testing/selftests/net/tun.c | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1be1c93adcd6c2f07654893cf97f8..463dd98f2b80b1bdcb398cee43c834e7dc5cf784 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -159,4 +159,78 @@ TEST_F(tun, reattach_close_delete) {
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
+FIXTURE(tun_deleted)
+{
+	char ifname[IFNAMSIZ];
+	int fd;
+};
+
+FIXTURE_SETUP(tun_deleted)
+{
+	self->ifname[0] = 0;
+	self->fd = tun_alloc(self->ifname);
+	ASSERT_LE(0, self->fd);
+
+	ASSERT_EQ(0, tun_delete(self->ifname))
+		EXPECT_EQ(0, close(self->fd));
+}
+
+FIXTURE_TEARDOWN(tun_deleted)
+{
+	EXPECT_EQ(0, close(self->fd));
+}
+
+TEST_F(tun_deleted, getvnethdrsz)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETHDRSZ));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnethdrsz)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHDRSZ));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnetle)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETLE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnetle)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETLE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnetbe)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETBE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnetbe)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETBE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnethashcap)
+{
+	struct tun_vnet_hash cap;
+	int i = ioctl(self->fd, TUNGETVNETHASHCAP, &cap);
+
+	if (i == -1 && errno == EBADFD)
+		SKIP(return, "TUNGETVNETHASHCAP not supported");
+
+	EXPECT_EQ(0, i);
+}
+
+TEST_F(tun_deleted, setvnethash)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHASH));
+	EXPECT_EQ(EBADFD, errno);
+}
+
 TEST_HARNESS_MAIN

-- 
2.48.1


