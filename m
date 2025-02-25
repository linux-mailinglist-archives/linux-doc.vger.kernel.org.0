Return-Path: <linux-doc+bounces-39345-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216CA44037
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 14:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63041665F3
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 13:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED9320C015;
	Tue, 25 Feb 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6+ANynd"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC3268C56
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488907; cv=none; b=HTEgypbWtB6t1/hDNT4q7zX4bXeE2rNowNL7s4FGw5fbtrDx31dJw1bP9dfkewjr4a7/Jlcs0MbiRJ74zJtpH+kAEETf5ESy4k1gEW/II+j7ZKLFfzrLYLYYQgEMqx5KdGALeeT7thw0Db9CAqrtxjLvUXb5i6ZirS6D1s/AyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488907; c=relaxed/simple;
	bh=YB1Vi94DwJBnT1kqmD7cGOwF9WF5WEa+EnaB81x43PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msMPFFJz/EFILkTk6xG3zs2MUv2lyy9Nn1r/uDX45M1oiaTEWNoRfjH6YH4/yIZUifbaQQrdJj7qXQbLSVtTHMbEG8iX4Po+DLhhHaUzhS5l5qvzbeG2b6wB4Kj6ceu9mve0W730lewhGiu307VNQgJ1Ja4vaZe2qUz9P05UVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6+ANynd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740488904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYCi8do/r4b+3U8lJEE+th0QSCLaiScWXLVoHM5qNso=;
	b=Z6+ANyndJiR5PYhFe9K+Vw4MU0Zc27mIf/79h+vUyy+3rr9/CHiCUFRcf5BuiNEsPGdUQj
	JQ+7PP9HBJzaz6V89ImqwsqiaUjhx3K1XbxRGs76b5TcWEHqy8JEKpTjlvYgW9ZuoYOAWd
	Xth/QESdZrHb9sBeoAXZl6F84Q/GQLI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-SIN_idUeMI-pKEdwiniPQw-1; Tue, 25 Feb 2025 08:08:23 -0500
X-MC-Unique: SIN_idUeMI-pKEdwiniPQw-1
X-Mimecast-MFC-AGG-ID: SIN_idUeMI-pKEdwiniPQw_1740488902
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f2c0aa6d6so2921623f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 05:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740488902; x=1741093702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYCi8do/r4b+3U8lJEE+th0QSCLaiScWXLVoHM5qNso=;
        b=BJYproQc57zbQWPDYJCEUqIFEjR35xKSp+T1RlrSPDchygwNowuVRYDC0JbuhPgK9X
         s+XeGC+W16asvhzGStPnwCdxx4bqCDoidS0qkrjHCVerTakLSDmnMIa1ZVGaWfONQQxD
         VrTERcRHuKd604NP0QSlaRa4GZH4B5k78oVDE8t06oD3ugv32ckeLRLo6epnE7tTGecF
         QuPSnXQn3iy4X/83m8WJy0RJL+oWGehjNbu4hRvaO78HXQX5Fk8g441e49gcf5XjqIhX
         5UT+eHyPB9pw/yUCA/7qpEGv245lLVYrYTvw9RlUHng2GOJvW2sT5ln+O+aNVbOGVSbg
         +zSw==
X-Forwarded-Encrypted: i=1; AJvYcCU1d2OPSG4ECRKdx40me+YwQsVZREkEGAkYrueePuPQVNn2Bkz+65vN4h6owNJfHWCzJUqkbbeD+mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcxguJTSMyC1QAYdIGpLBgsLTFwGC8Dyi7Si6nWLlKusmeMVBO
	98Y6oPylMaLmvNxcJlHXRPF0vwLvAo9dB3mPWHZwxTIAjFArSuMVIvLuNBkddPuVPoLSTBGqSnV
	5htPBGBEZRcN1t9YOWIBG81tU39nJpwzy2fXbkFT947ylHPx0nwiBnDmVhA==
X-Gm-Gg: ASbGncs9jQigzs868Mq9e0OGNCdSxJZqArIwv3BSd4SHJHUbXiCfiGEPOD+BzVP3J+O
	5YvnKpL74bYoLvPtjHErtDeEMWDyoSav7Kgkr8Q2KyTxNGEJgRIIamXCpv8UJ+QEmUUiXGQWns/
	0lFDgGcsZ6myaRCVqWi5NBM/LKiPrSHpvhwfUtqlIgZGnxIenQV0yY14dxaj/qakRuhQXTurkaH
	KEdTMg3saZMboEtsJJW1IB8BByWXMTtfPRyvib6WKLegsMWULx9bixfvBpBRBZlx2EDLsL3MLc0
	5FPXUSurb1VSOVpfb24ouYPi+3l1XIRahIa6HHzcBOY=
X-Received: by 2002:adf:890a:0:b0:38f:232e:dd5e with SMTP id ffacd0b85a97d-38f616331ccmr13074266f8f.22.1740488902296;
        Tue, 25 Feb 2025 05:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCWYJYXZWx2SXKxmO9SJQ8q5BJdPD/+84uCyQ4nFYhqg3XY9FbPHsmFwSlBu4NUyZbkzcpCw==
X-Received: by 2002:adf:890a:0:b0:38f:232e:dd5e with SMTP id ffacd0b85a97d-38f616331ccmr13074218f8f.22.1740488901830;
        Tue, 25 Feb 2025 05:08:21 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e725dsm2304082f8f.63.2025.02.25.05.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:08:21 -0800 (PST)
Message-ID: <3fe0dd96-0aaa-47a4-8b77-be737bde8e44@redhat.com>
Date: Tue, 25 Feb 2025 14:08:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/9] net: devmem: make dmabuf unbinding
 scheduled work
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn
 <willemb@google.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me,
 asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>,
 Victor Nogueira <victor@mojatatu.com>, Pedro Tammela
 <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
References: <20250222191517.743530-1-almasrymina@google.com>
 <20250222191517.743530-5-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250222191517.743530-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/22/25 8:15 PM, Mina Almasry wrote:
> The TX path may release the dmabuf in a context where we cannot wait.
> This happens when the user unbinds a TX dmabuf while there are still
> references to its netmems in the TX path. In that case, the netmems will
> be put_netmem'd from a context where we can't unmap the dmabuf,
> resulting in a BUG like seen by Stan:
> 
> [    1.548495] BUG: sleeping function called from invalid context at drivers/dma-buf/dma-buf.c:1255
> [    1.548741] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 149, name: ncdevmem
> [    1.548926] preempt_count: 201, expected: 0
> [    1.549026] RCU nest depth: 0, expected: 0
> [    1.549197]
> [    1.549237] =============================
> [    1.549331] [ BUG: Invalid wait context ]
> [    1.549425] 6.13.0-rc3-00770-gbc9ef9606dc9-dirty #15 Tainted: G        W
> [    1.549609] -----------------------------
> [    1.549704] ncdevmem/149 is trying to lock:
> [    1.549801] ffff8880066701c0 (reservation_ww_class_mutex){+.+.}-{4:4}, at: dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.550051] other info that might help us debug this:
> [    1.550167] context-{5:5}
> [    1.550229] 3 locks held by ncdevmem/149:
> [    1.550322]  #0: ffff888005730208 (&sb->s_type->i_mutex_key#11){+.+.}-{4:4}, at: sock_close+0x40/0xf0
> [    1.550530]  #1: ffff88800b148f98 (sk_lock-AF_INET6){+.+.}-{0:0}, at: tcp_close+0x19/0x80
> [    1.550731]  #2: ffff88800b148f18 (slock-AF_INET6){+.-.}-{3:3}, at: __tcp_close+0x185/0x4b0
> [    1.550921] stack backtrace:
> [    1.550990] CPU: 0 UID: 0 PID: 149 Comm: ncdevmem Tainted: G        W          6.13.0-rc3-00770-gbc9ef9606dc9-dirty #15
> [    1.551233] Tainted: [W]=WARN
> [    1.551304] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
> [    1.551518] Call Trace:
> [    1.551584]  <TASK>
> [    1.551636]  dump_stack_lvl+0x86/0xc0
> [    1.551723]  __lock_acquire+0xb0f/0xc30
> [    1.551814]  ? dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.551941]  lock_acquire+0xf1/0x2a0
> [    1.552026]  ? dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.552152]  ? dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.552281]  ? dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.552408]  __ww_mutex_lock+0x121/0x1060
> [    1.552503]  ? dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.552648]  ww_mutex_lock+0x3d/0xa0
> [    1.552733]  dma_buf_unmap_attachment_unlocked+0x4b/0x90
> [    1.552857]  __net_devmem_dmabuf_binding_free+0x56/0xb0
> [    1.552979]  skb_release_data+0x120/0x1f0
> [    1.553074]  __kfree_skb+0x29/0xa0
> [    1.553156]  tcp_write_queue_purge+0x41/0x310
> [    1.553259]  tcp_v4_destroy_sock+0x127/0x320
> [    1.553363]  ? __tcp_close+0x169/0x4b0
> [    1.553452]  inet_csk_destroy_sock+0x53/0x130
> [    1.553560]  __tcp_close+0x421/0x4b0
> [    1.553646]  tcp_close+0x24/0x80
> [    1.553724]  inet_release+0x5d/0x90
> [    1.553806]  sock_close+0x4a/0xf0
> [    1.553886]  __fput+0x9c/0x2b0
> [    1.553960]  task_work_run+0x89/0xc0
> [    1.554046]  do_exit+0x27f/0x980
> [    1.554125]  do_group_exit+0xa4/0xb0
> [    1.554211]  __x64_sys_exit_group+0x17/0x20
> [    1.554309]  x64_sys_call+0x21a0/0x21a0
> [    1.554400]  do_syscall_64+0xec/0x1d0
> [    1.554487]  ? exc_page_fault+0x8a/0xf0
> [    1.554585]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [    1.554703] RIP: 0033:0x7f2f8a27abcd
> 
> Resolve this by making __net_devmem_dmabuf_binding_free schedule_work'd.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

I'm sorry, I should have noted this in the previous revisions. I think
this should be squashed in the previous patch: it will not make it
significantly bigger, and could avoid weird problems on bisections.

Thanks!

Paolo


