Return-Path: <linux-doc+bounces-87431-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO3NGcr8BGrxRAIAu9opvQ
	(envelope-from <linux-doc+bounces-87431-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 00:35:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74553B80C
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 00:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D24FC301911E
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 22:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C5F39DBC0;
	Wed, 13 May 2026 22:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1W/x9tk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D3390990
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711750; cv=none; b=bLsisBRhS6d7sZYFhYTvTR//W371OkDQGE85BpEcYJ9FFVg1oUaJsd8yZC+lb59Zza3Q7f5utXf4NbrtLVUTIIj0OCHO9q2BitBlhlrzzrHB0Z22xNGKDaQA1UMjIt1HZzwzf4mqiJKRKLlXRI2poeXZjxE/XjVxgNPkBCKR6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711750; c=relaxed/simple;
	bh=gUrd+2r+CJ3+MIRtHvFv8bVXhWR3+Vlfirm5NflKs/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKfeBsm6D7QQh+0TooCZ/qUZXFdFRfzSzuMsNP+ddY17Gx28Q0YoMkJuf1+KgYQZ1f7lNeslMABOlUDGtAHZFPxsiVbggIkv1XrHAN2Fclfk4o6sCJgTruDG5inN+SMf0FbdUlz3+cGLJZS+JimqaF+MS5AWKHdnuRRiYc9TLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1W/x9tk; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-133466cf955so1118961c88.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711748; x=1779316548; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gUrd+2r+CJ3+MIRtHvFv8bVXhWR3+Vlfirm5NflKs/I=;
        b=c1W/x9tkJXXj98dkUCkQpcbm8AOT1+681olav2PXe7F14Sp/82tzsA5eOJhRBiSxT9
         1c5NGZyNAbhVtt1xAGmLHK1dmJGjel5NLYeJbYSxyUGQxsz875l35/mw7hb1JDtyVByh
         L+1G4MhEcfQsxglyRX1S4ZW/x9ZKPJExHubcPlal88hfUBJV16Pc2IlMYgGhT7P0j37q
         Madw4ZPj5JaaA9w3vGAMPC+jP0LDpWyYXEhaNKD5tL5La4YZ5RzjZAygPILSRLyv/tZh
         e3G4DwVSBvXoM7HeGq48S5JO4YU2U2f2sGdkAvMaXggJyqsJjW+o9pM/V7P97FL1WZf4
         sOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711748; x=1779316548;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUrd+2r+CJ3+MIRtHvFv8bVXhWR3+Vlfirm5NflKs/I=;
        b=tD1xjvK7MxM/kHm94Twr2sIOahFusvCa11wBpNo+5RK9gxMic6NzI1jg84IImfyjjp
         tQ2lBQ2KbQdp8yly/zA/Fay06gJ1qYGt0SUpgZYKfd90LfG9jw4s49Ma+we60k5eVVaI
         5t7fMNf8kiYnDPoeoOwnu3owLk0/evr38nNNDyNco6PE8JLeMmUhCWt2S0L6r/Gh3Msf
         FyLhkxTvEPV9kB5hIsPAgtq9lE7qA8EHx4OPP44b94Ckp+NTYmL72xGaXhMD0EYWjpcd
         6yS356uTP6xIQFC9clYKfbn8Xlw30VctBDZIjf3RCVkGb5eE5Ex79CnJifPo43Qrm5PP
         bpEA==
X-Forwarded-Encrypted: i=1; AFNElJ8jsYI7bL29GWkdFhBMA0rc7Gsa/BRKFOgz0Z0soY7fq+ZNz1llSrmgFQhl84m7jL7HywW3yH5M/w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPegvv82nW6/+13Zh44QP17IlqYPhRO+kZtz01mkNHWRbWR6Bx
	B/NC90vGYMBi5h00cd6v8nw+e4cJ9ewzIiix04Gt5kwAe+/sQNxZPS8E
X-Gm-Gg: Acq92OHpJeepCC+NGUpCbCJH32d6R7Y9ZyOztiFRxSnTWQ39Cxrb1cG4Ky/6IsD8+9C
	OzfTt10LH3fuiNMj71ZvGmx0qqAyy/shou/FUdzkP9ztHVuiFH+YkUfRRvgYXdvzPg3zpv/Uqu4
	uy5EAtHG6icxGg2aykLH00SzCgw8qGfwaIZT6IC7Ns2mytGqxh9EFUT6c57zZdKwzgfMn+45kZh
	qVxClndD/jrUp0URO6fk5sU5JU1NRLOOIubNnFWutaM4Zr2EKUq/5nZnbq3IOAYYVzDiABsDSVt
	6/F0J3T5SnwpkrvbeHXqzv2dsZDuStwvuhLl36c8Cw7o01FBNI4eHCbRLbeDAEkGvLyKlV+SNJV
	b5lg8a16uLWNCtQzs/TG38b8Dy9OHGgj5uZX6czgcmUcixgBQBw+/5GzLSPjBLno3tDbUKYekht
	la1YZB3QIUWghNeldpx+iY97bxuEhsdUYjUoHdJVR4Dwwfv2B/h8BJ+NMqg/wBPm8k8cN3Hhzjz
	2VKZ0w=
X-Received: by 2002:a05:7022:4582:b0:128:d51a:5161 with SMTP id a92af1059eb24-1343699b60dmr3654904c88.27.1778711748302;
        Wed, 13 May 2026 15:35:48 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm1371607c88.3.2026.05.13.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:35:48 -0700 (PDT)
Message-ID: <f75e2c732e5ddf34863b1376722d9b727525fd1b.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 6/8] bpf: add
 bpf_list_is_first/last/empty kfuncs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org,  Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 13 May 2026 15:35:45 -0700
In-Reply-To: <20260512055919.95716-7-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-7-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: EF74553B80C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87431-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,lwn.net,iogearbox.net,gmail.com,fomichev.me,google.com,kylinos.cn,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddyz87@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etsalapatis.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Action: no action

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> Add three kfuncs for BPF linked list queries:
> - bpf_list_is_first(head, node): true if node is the first in the list.
> - bpf_list_is_last(head, node): true if node is the last in the list.
> - bpf_list_empty(head): true if the list has no entries.
>=20
> Currently, without these kfuncs, to implement the above functionality
> it is necessary to first call bpf_list_pop_front/back to retrieve the
> first or last node before checking whether the passed-in node was the
> first or last one. After the check, the node had to be pushed back into
> the list using bpf_list_push_front/back, which was very inefficient.
>=20
> Now, with the bpf_list_is_first/last/empty kfuncs, we can directly
> check whether a node is the first, last, or whether the list is empty,
> without having to first retrieve the node.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

