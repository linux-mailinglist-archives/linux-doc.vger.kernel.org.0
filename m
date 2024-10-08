Return-Path: <linux-doc+bounces-26747-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81F99400D
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CB261F26079
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACFB1E7C34;
	Tue,  8 Oct 2024 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="QDNueq+A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9D1E7C27
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370507; cv=none; b=TXnrko/XY5bplybOA/NsEiZHWOhucnKPLcFK591W7dDl9/z+DtkpcarXAWvr2jr3LOjS+YapSxf08vYN+PWJu6obtVWQrXz7TLe3uF7l9sDxBRL02yuFVUZh1DuALtUrCbpReHsy+0HDfd/Rrt4rvmnzpzJYK7fzEEyM/IGFxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370507; c=relaxed/simple;
	bh=lANdjeuF5u8nCug7V+6XvVtwfr4345Ds4BaIqTrhBSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=MRzctQWOuPMlDrEqolYsMKk2HoURotiDbhXC1IMr5IVlg3UyvANfL8BEgJO9JDnio788kYSWCJsxM3AZ1PFx+wvXVoO/OZ0HiD4TTIsJn8cR2rf7W3qmb+exGVwzVrP38YM/Z586DgdorClDsfac2gde7TLtTk71Pxb74Wwi0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=QDNueq+A; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c58e5e800so1790605ad.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728370505; x=1728975305; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dvPHHUdir+WDvdCaxVm3cJC63BLzIFu5EZfdDdcBS8=;
        b=QDNueq+AeRQoRn72/ck64S6BdCIh4ats6V6JhBO+aotsr7mK3mom7IlnRWX+l/zA/6
         fNAJ98NBiCm/3Tto8piMKGps+Qu9BSTfqTpdXKpDkPoCVd0VWeW5GO95gDWUbqBfKmlR
         zyJCpsUNi2t+q6wBHHIc1CYImSiNDRrLjw26O0jdDTFmWBJevrdXRuD7MMbvSo6Z9NLa
         /q5iFQR22ggMY/Xsy1aRVvthIhTV1YOVE2fR7+blsf3unGwT4HSYNuQu/uAnrIzu70zn
         cF5tRHFjhdqM17mLEn3OudX+Ivtv6IsVD6k21PkFFxNuVrWJKye4JGKObQoPlopB95Es
         JxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370505; x=1728975305;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dvPHHUdir+WDvdCaxVm3cJC63BLzIFu5EZfdDdcBS8=;
        b=LtqQgF1KYjH+Z5c4auziNBqKL6blMoOLjMRfXYrXbKWCydvuwr6+hwFF3TO0eMq1ow
         HK+Z2OXm1yIBRzlw6+0HJKV+hAYiJuI2UpeS0YO95Fy5lxPTXe5AO0GdzIojx0sUcLxW
         PHHiyeuej69N27jo3FZyzShxcl4C35ZWm8sRwye9xzKTFm2XkGJeDm9g1j4YWTvASpk2
         St3q8AJaI4LWLrtZ51MfvDAjmyQY5nj9+xKCw9MyJh8xx/26Ah4+PclxYhfPkoh7U4NE
         NckGLcsyz9xaGCdPVr6V3tpmsQ4/7hnhAvGRXnhg5sARMJVtZQ43DcGyk0cKPFDbVAUg
         pjcw==
X-Forwarded-Encrypted: i=1; AJvYcCX7NUBEkOMeIyxF413kl7x+rY5HjgTpR97s3Cs5LKsDrFu7wSRBS6ftUQnrIeWnzvnud3DueiCI5qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMPCZ76UTCH4IaDnjbnvHhFf19k5hUHDgpStNUzXm9Z1hmQ8V
	Tu/tDoE7q0LNvqP3LVsiWcYnpe5w+sdL6/hG4AkX74xw3HRzLPPV4UmZ0M1D/iTKPg/RflU33j0
	FY8s=
X-Google-Smtp-Source: AGHT+IHz3TcZF7m5dn69T56wM9r7uLbH/pxoXLCwFEF5B/fIFcyPsIk0p2kYddj3LyEN9FsnedlIaQ==
X-Received: by 2002:a17:903:41d2:b0:20b:a41f:6e4d with SMTP id d9443c01a7336-20c4e2bb35bmr36489095ad.15.1728370505493;
        Mon, 07 Oct 2024 23:55:05 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20c1396d995sm49759165ad.230.2024.10.07.23.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:55:05 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 08 Oct 2024 15:54:25 +0900
Subject: [PATCH RFC v5 05/10] tun: Pad virtio header with zero
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-rss-v5-5-f3cf68df005d@daynix.com>
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

tun used to simply advance iov_iter when it needs to pad virtio header,
which leaves the garbage in the buffer as is. This is especially
problematic when tun starts to allow enabling the hash reporting
feature; even if the feature is enabled, the packet may lack a hash
value and may contain a hole in the virtio header because the packet
arrived before the feature gets enabled or does not contain the
header fields to be hashed. If the hole is not filled with zero, it is
impossible to tell if the packet lacks a hash value.

In theory, a user of tun can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tun_vnet.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index 7c7f3f6d85e9..c40bde0fdf8c 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -138,7 +138,8 @@ static inline int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
 	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
 		return -EFAULT;
 
-	iov_iter_advance(iter, sz - sizeof(*hdr));
+	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
+		return -EFAULT;
 
 	return 0;
 }

-- 
2.46.2


