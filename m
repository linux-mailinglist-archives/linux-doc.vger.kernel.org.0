Return-Path: <linux-doc+bounces-43140-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10458A89497
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 09:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F561893F2F
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 07:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412D2798E0;
	Tue, 15 Apr 2025 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SaSrlG2N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5E27979E
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701219; cv=none; b=iQr8Im/mcMkb6uLdxhLU2ijYOhDA/m4E1dNfTgBu0DKwqLpTkLCWIzkKbB0tEuzPcwdEBpie/1aXFK8YnMTD49DHd439uOtZGMiTYj1SMcmqAkjhXutmJtSOLlNl6NX/7Y/1Nu6dBOsG6ZqZnn/dsUJkOPmrvm8SVkgZI52v5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701219; c=relaxed/simple;
	bh=h5dIhNUGRcNVLReL7I05zUY5kTUC0DzPldBHwsd5x9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOu9z8Ooy6AnoJ8wfIIkKCOgkbYS4xrWW7w+v1YG7yoQ+Mn1RPyNwWRrD7BNGqUl8B9YJr/i5DYdxRVSEOfwN8cNJXbwMYhOQSgEYCkByVACniO+3HZUNtNwOJ6QsERGwV+6Qyv4t07pRYH+lgMO9kU9jsz4woPSusTHk4kmtwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SaSrlG2N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22a976f3131so53304945ad.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744701217; x=1745306017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvP3jktdcQlD/wgwVWubnz5z+eT6waZA1U4rtXZRHts=;
        b=SaSrlG2NoX3QQbjT2KAZd263HQGTexf+55IukAw8U7sxe3JSb0Hm0tqgpSX8Bm0gpb
         1KaF380X4EnRJAWWCIS9hVhm6vWAM5SgtBpgpefrE9LF9I69ybzHjK2ZCWiePpg6IK7u
         4qzjEk3Q51umeo8sCsFII/9TFyBc1VetlGBjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701217; x=1745306017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvP3jktdcQlD/wgwVWubnz5z+eT6waZA1U4rtXZRHts=;
        b=AYvRuMbm+3+ycilP60Pta/ygrl2h9TPKxH+vLSeThNVNUCgNuVDygWcT2yaQKLxd96
         U4kKNd1o5dfKpSF5c/6PPZRk4N+nUc96K4X4PErY0ZasCY/0/CE67uocT4pxmLHoaDAJ
         MXvKMsqVTJscQxZHS76t9vQt2Bri4H4n8IbN2TYwt42IqOs+tMZkDpD0MY0COG2qa7iT
         FNO0zn3wCWnlCAqpbfgw4JEqtUJj+6gFS89IMJ+aSEhLr1nDt8t11jD42YxO9UyN6dBU
         p1eT2PqToVj9mKkAGn0X6RcPNl/DbI3paA7M1+Cr3/EIXWtyDAFYfPRGsHNhGHZ/4EH4
         xOQg==
X-Forwarded-Encrypted: i=1; AJvYcCX9F4BYHgbn4jFnfMPRIOv+yy71+g5b6z0jK/HFSaAI47FjGrZSIQoX2e+qgfIGB9efDJ2o9ONhklo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSo35yJmVoUo3DD7wWtajcx1ze7ucDTiVsZPXmXJtQZtThRdbY
	JWecGvOkgkq7cK7WKHsD3nY6t6LvDs4dG7z+bEnPm0KhnGCk2mnbSkYZMw/QMw==
X-Gm-Gg: ASbGncvzm5lRBFFfgaMjpaH1dUzJ9DyhvZJ3dOhMnegdz7W5pXLyIeOku/+dstIxpJs
	NQnC3bFTaKtd6d7FYq7e5Ldd06tk+FtUHGKnZP18mQ7WBV9UvC1BWDEqKSveivlpT8JlYUwhBmU
	LiMVPUxIblUQ3puuNRRQS8rCuYc6tjhn7f09I+7gazYbCNwuv+IfGcS3HSTMTm+57QdNL6l+xOt
	Z+/qvj36sbrDPBVWwaahxQIDb/Icnw9On2ud3lF6Sgf88XjOFOjPBb2g/JNWJHsfBaYMau1X6lG
	RPqU1pB0FegR5KkYdsYLzGppCRr8y5Pnfo53E0mpn8MllfSaZb5CoKyuQt9zEYUmtIeLulHbdYH
	Vr83u/GwNBeJAn8GZRpWgHOd//IPy8svh
X-Google-Smtp-Source: AGHT+IHzbUw60awGAdnr73JeuAX7Ko77w21zXHTS5A1bqgbmfAjViEsZsECWSFQGbmRiP92KE4/mbA==
X-Received: by 2002:a17:902:e5c8:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22bea50017emr210745615ad.39.1744701216954;
        Tue, 15 Apr 2025 00:13:36 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (132.197.125.34.bc.googleusercontent.com. [34.125.197.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65496sm110776435ad.42.2025.04.15.00.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:13:36 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	paul@paul-moore.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	selinux-refpolicy@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH] binder: add setup_report permission
Date: Tue, 15 Apr 2025 00:13:29 -0700
Message-ID: <20250415071329.3266921-1-dualli@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250415071017.3261009-2-dualli@chromium.org>
References: <20250415071017.3261009-2-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

This adds the new permission "binder:setup_report" for the kernel
patchset "binder: report txn errors via generic netlink". A new test
is also added to selinux-testsuite to cover this new permission.

Signed-off-by: Li Li <dualli@google.com>
---
 policy/flask/access_vectors | 1 +
 1 file changed, 1 insertion(+)

diff --git a/policy/flask/access_vectors b/policy/flask/access_vectors
index 58a559ca1..36817566e 100644
--- a/policy/flask/access_vectors
+++ b/policy/flask/access_vectors
@@ -835,6 +835,7 @@ class binder
 	call
 	set_context_mgr
 	transfer
+	setup_report
 }
 
 class netlink_iscsi_socket
-- 
2.49.0.604.gff1f9ca942-goog


