Return-Path: <linux-doc+bounces-26750-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8799401E
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 09:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85DC11C259EA
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98E11EABCA;
	Tue,  8 Oct 2024 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="fbn6LwAY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD8192B91
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370524; cv=none; b=AtbIPdVacGj92o6ACxxdyzNEsaQ6Tsyz3Hzbme3sM2INhemOGq+rMlY7TcRgpWBPNcQzUNwkN/g377qWb2BraLPdJxwMXK25p+ZYn6PUVG5jfeg2lfDFAJrt4rQNQ1XQwBAv9ESN4CmHY0bw83VhgaGwgAGJhr9ATCRYIWnqlZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370524; c=relaxed/simple;
	bh=aMMcGMlIvM+5vysEFQY82Ld7Vd0lkGqNTVfE62GAxgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=rZF7GMldOO19NhQkhUFTvwQUGLPSXlEVEH588YHwNXTFlVRNYT25hBDsx26DW6fIL0Ya4HePgOHqhdxzyxEAKQdcAewnqQB9RWHnwY8T9eF5C07fLW1m2Ls7e9SMjPQNIKmwEXslpcgziKL8hJlo5CP9mbrUp8fNL214PdUHdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=fbn6LwAY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71df1fe11c1so2178499b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728370523; x=1728975323; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uKsejVxLmGPlZDZ2YAoWDts+QfkdC5shkCFnDsQphM=;
        b=fbn6LwAYVthJyZbOP4oovN7AhFDxbR7oOfqsUG87nITeQuJu6PX9L5AWV8rJp00ZQy
         tZfr9XOzje0bdMioDyYb2HRr2jHeIMtNDglaL4PlrjH9vIC5aJWrbb/dpyZch26DUaja
         4I5G8HpHQZxrI3SOBkmhLmzBpBQcXda1VHzycorH1EyBv2GEOQpf2qKoHTluaGnTBwj+
         XKRYDm4y77LlF/czwFZOpa3qrsNzXSflVS4Ar1+WMTYdi1RpDcYyKFt4JOz8+KXesfcx
         hlOUW0N8OY2UWoYVefrUXI3WPHEjVbqJq2JG/bMAF3kQPZcxqPJ2tRbw0e0Rq06CT/Mk
         /7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370523; x=1728975323;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uKsejVxLmGPlZDZ2YAoWDts+QfkdC5shkCFnDsQphM=;
        b=FA5DeTJe2k5XL40yhDj/Qr1B+K+95ZcG/PqQI/DwmJUevvX09AkDor7VOtwpZKzf16
         TqfJuOESg2OCA2wa+YioG3biH15oOkWJyiagC+gYHLyaKc6cnnYeqvcHDC06q0V/GUQk
         9IoDpNJvA81IwNUL9SbGNnDhvBTPTxPQJqpCg1ZgH5E7EmmGi9/C9rWRS/a00wd9OBRm
         INuhMdVn3ZYwhpQthvKLfop9omhqpK1H95n6pIF60ZRxP9L2XoQKuD2U501XxC+KTmDi
         g+2dno0gRVE9bCHw4z5AjElw52y44f5xppAZeZwepR2BsqvQfz/Cy33FpYgVU0fSR712
         QY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBIiQdaUlbhdDAAFZCosmA6T7J4MiMSS3QHYuu6uYENEhDxgRmyUMWH536hr4qF2P4G948z2c16RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8IZun7a5rQaGP338EU5ZoTng1XxdEKBsIqTlNXcuQvxBIL0S
	bjsC37o8Edx1JKjyXCmtvYKZ9x0OlzExxnoeBYOXAaYI0+2y/bd2Ockq7OdqGg9CQPK7361fcta
	x+0M=
X-Google-Smtp-Source: AGHT+IHpl6coI+ZO3xm7Go5SLIOAf4hTK2yXXSof1uFkX8umSQONLP1U9ZQGcbX4LKYOwCaQ5jp55w==
X-Received: by 2002:a05:6a00:84b:b0:71e:183d:6e74 with SMTP id d2e1a72fcca58-71e183d789bmr246332b3a.4.1728370522610;
        Mon, 07 Oct 2024 23:55:22 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-71df0d65246sm5463299b3a.169.2024.10.07.23.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:55:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 08 Oct 2024 15:54:28 +0900
Subject: [PATCH RFC v5 08/10] selftest: tun: Test vnet ioctls without
 device
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-rss-v5-8-f3cf68df005d@daynix.com>
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
In-Reply-To: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

Ensure that vnet ioctls result in EBADFD when the underlying device is
deleted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/testing/selftests/net/tun.c | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1..463dd98f2b80 100644
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
2.46.2


