Return-Path: <linux-doc+bounces-40080-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38FA54706
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 10:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254FF163B43
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 09:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A620B817;
	Thu,  6 Mar 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="1f4Gjbzb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298620B80A
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255034; cv=none; b=cDaWLwWYf5f50BEYxI1wjk4QTeWQk7Obm6icR3ezP5TJgQ7cTZzglafB/gMNEQtrheQxuppZQSxJ/d7xjfo6bNQ4g1tu/DOiroF/GHP4mN3t+buS26nZpUe5EQ5BROyqWl8VCyXntxzZQTL+U2SFfi1CBceimx9/fKckeRP6MA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255034; c=relaxed/simple;
	bh=6JPnLhL8s35dB03n039XAvB3PJPp3xjiscDs8gfFdqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=HgzzWs3igSHvUMj8Lmwbn0iUIDdWBEjYpDe2oLQBerkjFec7+5entA4MyJH5f61gAAE7U6aRFtpyY4UgX2QlrknrADSXMPAot88/sf6itSHK9pwXUnaLc4A4X287yMjD/UU9vPTWWo/506Zt2qPXIqrT/3Mqve2Pm16egZKRxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=1f4Gjbzb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223a7065ff8so8886155ad.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 01:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741255032; x=1741859832; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hY0V7oey/1irsg/oxeJVyzd/IX234qFLR74EBUPiqoM=;
        b=1f4GjbzbUQc2p7rObP8Rffq2hgjmxG5ITm/OnltgmggFk1HeiI5d00OnQ/FuL2k2Iz
         Nh8YEBYAXNdVn//VjatBjYFbzbE1QQjDVJ/HV7bS9fFT9c21xAVJnv9rztsSNfjXBGtb
         Noyz7bxrPpGYFGCCVSf9QkbrekXZBREZYZ9zSD3Xj3wOldG4JEx8dwfT+ThnhBCJfi2v
         7p3iBBJF6UnuMv/7xID6Z9X9OGWyltMqGOwjDT3ynAdbnnK8gc1KarD6KmCJtbEu8q2P
         0vdcHjZNfJGx5yhTI7hBtvdCru9KbRVRjBc5/C1lOdisJOjKoWjds+vieOUjWtaQ2Nrm
         0MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255032; x=1741859832;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY0V7oey/1irsg/oxeJVyzd/IX234qFLR74EBUPiqoM=;
        b=DTZRXlQEJgysZ/dAWp+nzDw4+O89UIWIGTLOuaqCN363qq5cgCHqebyn9GWYM/hJUs
         cH9Er6jHkOau1XD59JhXtRwsQl5DsUM6daYwfbaBurysmpdeCGKoO4sLLJs3yhxlbOcF
         08+j/YErM3EZzz2TiIzFwm+G2VBa07Fcm4Lkq+NbnJjr7Q0eT8BV92eJsahizWrjScks
         D7yw2VGJm5yOQtfo4djT5GTqY1eB65Uidmt3E+S2mHuHavaPzfoBQ69jTKI4CAbxOudf
         4Tr+faKvs7nvjlhYv6tY5y2ETZCVAvPSNyidPXbWK7B1TOZCWpmMk1WGkwilTu9DDf6o
         ByMw==
X-Forwarded-Encrypted: i=1; AJvYcCWBTQR5DW7os3Qedq5LQAJw2csR4mxOS2yBZSj3ZsSD9d9nTq7P+DYXlVSWjG/qet+mbTZn8vSVZp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMs72ys9vp9Y5tS7CocI75syhhN1Q88cjMK8eMQcRV5f0qBoK
	OMBPmyQKHu+iJyfDl1fJWoOsOFJHQYLaMwTogq2IsBq5PowPu1CDckB/Ip6zy4A0G3OsQndyk1y
	Y1GQ=
X-Gm-Gg: ASbGnctYuelSsjTmLS+lzZnZYGx65QHZaMeJ85dOgnsh9AGLXrrPmROuRmrurNMA355
	uQ9xAOvG4TYWJJa4TWD3em4hWgbsCQBerkejBLJYDm/3mXqET9xWmBO4qakbHdrAmoq4Hy5WMs8
	rt6DJrYIAwexS+MnIYeKO0QUfs0rt6xOMJqoGL8ahDkWrKW5aXnhb51VK34dHZ/FzPVMiv8qrIl
	mBxEnVlYXJGyi5JSZRmrMKt2zYRxS4wA0E9DUTsQWd+mNjHXtDfP1OWozHJQbCF/qyGdas0QW0p
	+LeaaP6T7gcHJ4f8w0T92ITaHibTLWn5yifE1fQK3iI+//Mx
X-Google-Smtp-Source: AGHT+IGlvJ3QJNQ7zdOmSl6WruunBWchSJlMnXfPdh91/T3HMnxY+JOOEGUyqA7YRqbtPgOIa/y+WA==
X-Received: by 2002:a17:902:ea03:b0:223:f928:4553 with SMTP id d9443c01a7336-223f928486bmr88417775ad.44.1741255032170;
        Thu, 06 Mar 2025 01:57:12 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22410a7fc55sm8314515ad.138.2025.03.06.01.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:57:11 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 06 Mar 2025 18:56:32 +0900
Subject: [PATCH net-next v8 2/6] net: flow_dissector: Export
 flow_keys_dissector_symmetric
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-rss-v8-2-7ab4f56ff423@daynix.com>
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

flow_keys_dissector_symmetric is useful to derive a symmetric hash
and to know its source such as IPv4, IPv6, TCP, and UDP.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/flow_dissector.h | 1 +
 net/core/flow_dissector.c    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/flow_dissector.h b/include/net/flow_dissector.h
index ced79dc8e8560e25a4dd567a04f5710b53452b45..d01c1ec77b7d21b17c14b05c47e3cdda39651bec 100644
--- a/include/net/flow_dissector.h
+++ b/include/net/flow_dissector.h
@@ -423,6 +423,7 @@ __be32 flow_get_u32_src(const struct flow_keys *flow);
 __be32 flow_get_u32_dst(const struct flow_keys *flow);
 
 extern struct flow_dissector flow_keys_dissector;
+extern struct flow_dissector flow_keys_dissector_symmetric;
 extern struct flow_dissector flow_keys_basic_dissector;
 
 /* struct flow_keys_digest:
diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 9cd8de6bebb543c3d672f576e03b29aa86b9d34a..32c7ee31330cf52df05d7a23b3e50d1a1bed9908 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -1862,7 +1862,8 @@ void make_flow_keys_digest(struct flow_keys_digest *digest,
 }
 EXPORT_SYMBOL(make_flow_keys_digest);
 
-static struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+EXPORT_SYMBOL(flow_keys_dissector_symmetric);
 
 u32 __skb_get_hash_symmetric_net(const struct net *net, const struct sk_buff *skb)
 {

-- 
2.48.1


