Return-Path: <linux-doc+bounces-86448-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE7MNtL6/WnYlQAAu9opvQ
	(envelope-from <linux-doc+bounces-86448-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:01:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E84F83D7
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 552A530650A8
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 14:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B018C02E;
	Fri,  8 May 2026 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3bMKqn/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD23E5569
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252223; cv=none; b=el7FaYeDcNsj6C9LLqCQrUuRQOIiZvtpDTRsPax28cXffsXOm5BV8576tpPQ9+KBK7dRUCkjlcV7qjicQkOAPq/1w/h1MlBwjC5ShqqrZcGypuUp6oYkrna43pMY2enPXr6x3bcsskfj3wlGQ6OKtuZdc9SaTmMvLtDNBxy7s1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252223; c=relaxed/simple;
	bh=4/aVJnWaXKkXi45aVG/ghAkKHKmtNlgv64ubRDm3pNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVwo+qVNDJFXxVRpX8GBY4GQ8/zuAKsJSQq9D3OBkvYsWm0EKUmZ+ht3HCZVtikxIF57ug1WBFt0XJm8M8i1CFFaeYm6cpE2RbVJF4vJqb55+sP29oXGPmiUe4bcyof+qayjFDlH/hglvrZrNpNb/59KtMTuJ03AATLxI2p+mfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3bMKqn/; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so1544375b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252222; x=1778857022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKeh4P5RRX9HdRzyfTHqYV6PxblA4dDzAyEahLUA+Ik=;
        b=A3bMKqn/Gk8Irboq+VjkYR/RT3AMkP+uqrEWN1i6QzdfkjeKQeFGPEHxQOcNgVVCfb
         3BHfxwMeebOqbTkfNMbfaMt3dOOPBVmScJUowDz5LrgnEGB8ZWSB0vIJPKwqzkUk+Xek
         bOrlfoBKysN3MkFH5GCsFBGcnSxFY1DeVT+6QWI8MmY4PAhaWQRyJY1F8lIguVJv1BYn
         iwUUi2jv4WoQmeH8e5HLfsPdIEzbhIzTBE+wQrRzt+RT4vM3myf2jEOZSsZ7+pkrET1x
         8aa0PJk9TPozZc9utIvBCoaExaFcJieMoMI/sY4H1CgAacVTRrL9XW0vdmBUeAfVOzco
         /pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252222; x=1778857022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKeh4P5RRX9HdRzyfTHqYV6PxblA4dDzAyEahLUA+Ik=;
        b=rjItymyfMzjM2iyHWa93mPqgBS9/0gXCMBuWwUMHYhObzMGjeYrQORqPjObl8otVda
         3lvKsoBF/KgQocBmU/c8a6ZLCGub4GDpivvXxMjdoyM6s4gVRwM0kqs/rkJCxWjUYltG
         PCmrd+BMpQ4xe3reF+2JTf92wcg1UOnY+9KWHzB531LOElh/t9zG7O79csC0KN65vc/Y
         bViyiZUIv+nFn4NnXRT3qDcDjyHjEAS2QeNYWbj7xe7QWvOG/MDMNVZG40zCyxP/xcCG
         5OyEeAfTVB3uGaHvTirYwQFEPCvVaEBW+MKZsPOoYE6I+1iTp/0gPGe6unSRe49iLJbu
         n+Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8tI9vyXqx43Ss9CHp2hVYIsJswKnCtDQ7HeXzsxorwArf27t8hdX4ILjpDCKATIgwXbNF359YUp6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzeDNkRD8/yiIgtvEm/nJAjSf0snFcDGaTyz/OMm6WpNoq8YU
	SVOyKJRkhYgn0k0y/SAAS+QbAjnpTHXubscCIk3nBFsItVuJF8c5A7Tb
X-Gm-Gg: Acq92OHNmpnULID77vi7lvgRCzOqQhZpRv0Dldd0G30TijGLlvMSC0Lz75mehU36uDm
	8JEF9T8qXQJoXi44dLI1WKWnC5p7PR9N5Gm2850VjUF5COwVeccVCT42LV7lmiMteSLNRvnWTWI
	Og99KRiyRSjGPfWr/aBedWW/g+8LxwXcwJO8Btq3TbTeiQ4/86VYNL9z7xbjWLaNrnpL6462VDh
	U2P+NccVNWj1mfHUwvUCbZz71w3httQqISbh9ykyH3L8uejeww/jfqXK/rm1U+7wfNMxaxAW1SD
	QXr1bKPDuAJ+p/xf6xcWonCPSx7YwdJ/nlwwoOy+kBO0g9f7H5tjegIxP5eKB0HrbW7L1Mkz4Fz
	2WvDSFbkGUF8cve3CyOfDvaENDaPtw58tR3iyCCAe8T38pWNTA6dsx6yPiXd/NV1JdjioUH/zSI
	6tiGkCJkVfY3kLKtmr
X-Received: by 2002:a05:6a00:4195:b0:824:374a:1407 with SMTP id d2e1a72fcca58-83a5c4bd711mr13683272b3a.16.1778252221575;
        Fri, 08 May 2026 07:57:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm16492392b3a.17.2026.05.08.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:57:01 -0700 (PDT)
Date: Fri, 8 May 2026 07:57:00 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 2/8] net: netkit: declare NETMEM_TX_NO_DMA
 mode
Message-ID: <af35tYOAr5Xymm20@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-2-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-2-52821445867c@meta.com>
X-Rspamd-Queue-Id: 6D7E84F83D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86448-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn,broadcom.com,nvidia.com,fb.com,meta.com,iogearbox.net,blackwall.org,davidwei.uk,gmail.com,zte.com.cn,vger.kernel.org,fomichev.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdfkernel@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,fomichev.me:email,devvm7509.cco0.facebook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Some virtual devices like netkit (or ifb) never DMA and never touch frag
> contents, they just forward the skb to another device. They are unable
> to forward unreadable skbs, however, because they fail to pass TX
> validation checks on dev->netmem_tx. The existing two-state
> NETMEM_TX_NONE / NETMEM_TX_DMA doesn't give the TX validator enough
> information to differentiate devices that will attempt DMA on the
> unreadable skb from those that will simply route it untouched.
> 
> Add a third mode to the enum so drivers can indicate 1) if they have
> netmem TX support, and 2) if they do, whether they are DMA-capable:
> 
> NETMEM_TX_NO_DMA - pass-through, device never DMAs
> 
> Widen dev->netmem_tx from a 1-bit field to 2 bits to fit the new value,
> and declare netkit as NETMEM_TX_NO_DMA. Devmem TX support over these
> devices comes in a follow-up patch.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

