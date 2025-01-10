Return-Path: <linux-doc+bounces-34726-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CBA088FF
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 08:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF3227A1CB2
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B605C2C6;
	Fri, 10 Jan 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLLSpljM"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FC12066C8
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736494635; cv=none; b=dHE8643JT83hxqbMmMUJvdIQQSPKyTYL/fBNM0gymS8ZLTMDYA6NQ3ViO2eVz/6S3JkBkD/h7+E35cM+yn+SlGygiFunLoHhj8rmG7e+QJSKvGnBjZR6PMQ4qgzrbTLQiYnEb/VJuB74ICkZH2T39UdXSzfYrrIxwWFPJSFl2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736494635; c=relaxed/simple;
	bh=lKkX0jSDmzCgHP0q2ZI55ieL6iTIROIb0PrZYeN893Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7BfO6VICWIydnPrOM7aj9OZwdxsqDQLiCDGONnWQgIdMTeNNmm09ZCXnmvs8k1IsyoorKPSabbnZQmA6i2xu2rEIcsNPyEUH0+H36kN5DFgZt8EXp3GOMhvbujS3lQMVf0bKdh5eXa0TzK0AuNYi1gMlL2vnlTqG8rj77L106I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLLSpljM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736494632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKkX0jSDmzCgHP0q2ZI55ieL6iTIROIb0PrZYeN893Q=;
	b=QLLSpljM8n+I/4XrN9pqJY8Q/snSUYtrzlUFL7MHbjkUFR+blXvc3R9nY1eBnyxdSzciYj
	Rg/D2KC8ESDPZTHhMBG+d0PFWqBUrhGZPj3HDvNRKDBnG3bUw//uhbqEJ9y8iwZKYluwuC
	u3l8WP/vF6NF1QFhe3qHO1p69YY6FAg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-nSS0nyNNM4qXi4ygHA40HQ-1; Fri, 10 Jan 2025 02:37:11 -0500
X-MC-Unique: nSS0nyNNM4qXi4ygHA40HQ-1
X-Mimecast-MFC-AGG-ID: nSS0nyNNM4qXi4ygHA40HQ
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3dbddb891so2959391a12.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 23:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736494630; x=1737099430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKkX0jSDmzCgHP0q2ZI55ieL6iTIROIb0PrZYeN893Q=;
        b=CHCu0yYL9r8bt5NwMdlo1DXMQ8Bui4jhnOfQ2fXdo8caR6oiqUXJ3WR1jVLgIl/dfz
         SPhFpTWAT4/+Eqzh5V9lk0bXBDZ9M7RLKNTPXYBOQ7AZydQ069oOIPXBW5uSC3OiMchX
         Uvb29sr1UZXhQE9tM7IbinJsdKyk4uWk1e4GUFjlpFllxEzMG4KkHv7/L+wer32CUXwU
         a8hZtWdTpnfLYSYHS2mTaRzXmVjNN2aEfHpTtYNvqK7HOSAKAIW2HDDrPVIVw56bxXr0
         Ar1lWUJlwZ/CIpAWTz5ER7w4KvJ/+pBLzuKw0OHfsshuwB4UltiWA4OfzmiRA6V4ZXzL
         n6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ipFTYrDOhEvAy+iGMTdWW/GpnOBx/EXXEkbNyATShkf03wSks+T30M6KR5bO39ogtx9VLU4dOXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLp4shzzaUWAf1tCeWOUsmQHJ7wTOcg4w8EBvKdsevIOqeds7
	9JA4RivG8RVIkokR6AOeAS7WGhitWD9mxEbmsHZA8k8V8W4ySk+C6jQXj0AsfF/K4/JNkA9bHV3
	7n+x7GwQE0TU5nDejEAIbl1r98IaqlpRzS9Aq2qc+RXjAquLn4kUUcHEA1ST1Ld6Tg7TWLk5tfw
	tOh6BPiCkY2J1SMj5/7ThNFj9HvhZ1Z73E
X-Gm-Gg: ASbGnctdk8spiyyXwyANxgwA/gNpvN+7kQ2jQoO/FXJuRxGD3fMb2mpaTSRpLcQ/fI0
	QbiK4g2piwglwzqrtEoqizsOOcKnm0aiTTy9ZUaQ=
X-Received: by 2002:a17:907:3d91:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-ab2c3c452c8mr540919766b.8.1736494630061;
        Thu, 09 Jan 2025 23:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM+E3EJ9VIADqft4XZeqnSe1+lGGIJwDA4N/xijHGbaNmJmQVeQUzAlHVdy720k+fmj7KB/3fUzKLdRp4U0YE=
X-Received: by 2002:a17:907:3d91:b0:aa6:7ff9:d248 with SMTP id
 a640c23a62f3a-ab2c3c452c8mr540917566b.8.1736494629743; Thu, 09 Jan 2025
 23:37:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-rss-v6-0-b1c90ad708f6@daynix.com> <677fd829b7a84_362bc129431@willemb.c.googlers.com.notmuch>
In-Reply-To: <677fd829b7a84_362bc129431@willemb.c.googlers.com.notmuch>
From: Lei Yang <leiyang@redhat.com>
Date: Fri, 10 Jan 2025 15:36:32 +0800
X-Gm-Features: AbW1kvYh6DcaW0cgKJgVFtgsup_78mHRUFkOPq--rB-NQ70GCEus3ijRcbVoJWE
Message-ID: <CAPpAL=zta_HNWcWsbL=0ymRfd_ZKx1nZ=F+Jo4kLXaUnqFnLDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] tun: Introduce virtio-net hashing feature
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested this series of patches v6 with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Thu, Jan 9, 2025 at 10:07=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Akihiko Odaki wrote:
> > This series depends on: "[PATCH v2 0/3] tun: Unify vnet implementation
> > and fill full vnet header"
> > https://lore.kernel.org/r/20250109-tun-v2-0-388d7d5a287a@daynix.com
>
> As mentioned elsewhere: let's first handle that patch series and
> return to this series only when that is complete.
>


