Return-Path: <linux-doc+bounces-93105-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/ECCmlUOWrGqgcAu9opvQ
	(envelope-from <linux-doc+bounces-93105-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 17:27:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B06B0B67
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 17:27:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GYEhX3sV;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93105-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93105-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A33A300980D
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 15:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E03B38F93B;
	Mon, 22 Jun 2026 15:27:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313C376A18
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 15:27:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142052; cv=pass; b=jjhwxClVhOKk73VsG/OuF49omKKG44Fd2P9/6ULYPkPxsPwHmMLdvmGrOdJhPrFzmjyJOoziaOtBrf/Jalngp4rF6NVQ3tiRcV6qYGy7IpTSUEOCXdLHmimw1lRXuI+B3WKr2XUd3ofroFTaNkMertkvRb/spSIcYnzAF0JajvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142052; c=relaxed/simple;
	bh=2uv6gQ7GKYPkzFwi4lxaTpmi5E/Y2YNpE6234rGNOfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ote9Ck1+wJRNsLgUkCta86PQ47WUCLoKd5c9IkXpumIXLSysjlcprd3bdT36oUA8zt+WCcOP8dUztj1w5zp6c03PoCn0LjD4UKot1ZIXssfmUNzHZxS4en56aX600ctd1DFLI7t8B5mgps1SiuN3iIZrUhwZMIaO8stEsAP7aeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYEhX3sV; arc=pass smtp.client-ip=74.125.224.41
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-662c5427892so298782d50.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 08:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782142050; cv=none;
        d=google.com; s=arc-20240605;
        b=GRn+n6aazf81NPpS8HMLIDCR0UkMu0cwT2l9slPeNGei1jDXDE+7NIeoPTqqxBbubh
         fLvjxezZcMHYeE6QXvb2g39m5g6uSO5+q+fPcCRvtCckxyqN44k1U6eRUEtpPF9AQJZn
         /ixPKEltHs2iPHY7wYusbzz0xloGsMjvKoPH4zCJ1VPVjz1xKWTXBG8CVkEw1xTCIwKG
         e7FB7reONMsJi1Y0+FK+J+AdlvIywYKTJOBLJjv9gJhzgXcs04hY+H1e+6tqPShSJSCm
         HeM6mkcGMHtNQgR5PocLn/6SvhndFtJ1s4vOL6N5tfOaojWnSY9XPOo5qKdVuNbpNZPU
         6IVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pGyvBAk8euMcJ38wECstDr/70ytuyfnKpcrUWwgIxnU=;
        fh=HK791f3y8XoBLF/vCdUUjbhlP62lSpG+Uma+IHbl34U=;
        b=kHZjBY6WgBWODfhkLvtDd42reEBWWLJvag7nAP9HVcI9Xg/7kX1upwPCxbvtP23zNC
         GM9Eo5/O0I+qAUzgfM3rqyFDkLpJk3GTDsWvS0FP9it5m0qs779zmUS4LTNtuov7POpy
         hOhYihHoiugfMJUj7UEPhe6jyimGVk1IyeXVCFHEhGWR3vSqYt+h+wACBoQBtgkqe/LK
         XXkHUwTs0XbhVfLd4E8lu+DsK9IujYB/xqHdg9eoIYDhsUUWLnNKr9hv+W1TyzZxLVqj
         ab8tuOMRz8VJaDDOmI8XVatV+g5EVoQiHzRGvKf8HRP4dD3LQnOw1HJhoKOBfsB3v7M+
         8nlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782142050; x=1782746850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pGyvBAk8euMcJ38wECstDr/70ytuyfnKpcrUWwgIxnU=;
        b=GYEhX3sVHL3rM6tBpinPUWu00QMXv99i2sjPddxIFpMtJchiznyFJAqPKoqMbvcfwZ
         f+Hf9o0MXtBBNswhl7Jay4zf+RRz6abK6N5ozwlcgMc+Ll6+RnKfjRKyIgCZjP1xhV+C
         5qYjH5QtgadYmcuPVIeRd2HhFuHnq7RdDlOefxJslBsPFQTERAuQl+fDs65Z2fbiGJP/
         X4v7WnC/F+bkIYD60YT/gmbhPI/PGTlkTyUjAiZm6IkybUVtborawCp1amccTlorImRD
         F71JJ+uJx9nOu26SUF/MuOsjIfnEo8rAjGVv1GU7yCCbGRlpOoNIWeVvTT74Yf+wYo2d
         /loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142050; x=1782746850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGyvBAk8euMcJ38wECstDr/70ytuyfnKpcrUWwgIxnU=;
        b=IzpWVGjLS1d99CPY1JDW88UnPLATOhXJ1ZPzZj9blrQTKempgkFtCKkhGcLD9z2xJi
         mV0Hkl9E1rNIS0/Lk7Jo/wJXNFyhCEmIk2MNEesDLwO0+xuH8EJShhWnuT9WkOkrMu92
         02R14pi1TuYAoX6eCJSTBpY/3O9emQ30SrsGvjOZIs9QVXasNdsnhwAeoWs01IdMXNRc
         6hn9H/6q5kV0rd81LGgU0O3C8EUvqQLFjPWziXgAPiJspQ2z9wXxF2EcpLnCChSyhPfv
         04Eyi7Sx6R5nL0YTAm0ep4B8ZpaXAHyvuKTc+25scy6SStcyf7pNCQXWtM1CR1hnxXbC
         pjBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro14oyAuxns9j2cS89wHwG0tXL7wD9K8/1HcKns4RmcipNbJvCLOejDIRJWwI3Jhuaq0WX3Lwz5gOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuHO0tI9wz7JnKHdulOzaqRqHBszKU8ccBfpmFYoAMqYjRPlZu
	Js61NtGJGKtJ8bTHY3/C6+dFhl2G2wLej0k0QxtbAmQ5Gq5/QvoihVa8xE/2LTHOzaOQjOB7UTC
	dWPBztu+iVw8ZhtstiUEPMTL4aJ44TcM=
X-Gm-Gg: AfdE7ckFqQE/YC064VfElX2j2ixaS2TnMbkuKSTkl6MnJphHH3NwozLSrlj7HHGPrmH
	Okne2CLE2Xc32Kx6Rth6MAewdX9+eixKzIjFUZ3UBN16P0TqqBHCo/Fv6EIQJLVJgiz5zW3We26
	/Wx1nbX6hAkNMpwFJX7gnzTgw1KpsW1R6MQTyAUcJ0rRIX6iTyNi1W5LIF5nQo+D1xDZ3bFPQjT
	ruI5ZGsBR9AO70FMenxrpN135+CbDFn7awfzB2aS/6CSnVtkAry8u54V5LkGshvDN2I8LnRIl+q
	NZUwl7dyD+ucDuUZbNiL1Tiao3US3rmuLHcGpOhAikhZTuODWiSyLksWux5MkA==
X-Received: by 2002:a05:690e:150b:b0:651:e194:5d07 with SMTP id
 956f58d0204a3-66350b6eea1mr765486d50.7.1782142049628; Mon, 22 Jun 2026
 08:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620122751.388770-1-doehyunbaek@gmail.com> <ajlLhFnMZGoVxLE6@localhost.localdomain>
In-Reply-To: <ajlLhFnMZGoVxLE6@localhost.localdomain>
From: Doehyun Baek <doehyunbaek@gmail.com>
Date: Mon, 22 Jun 2026 17:26:53 +0200
X-Gm-Features: AVVi8CdlAu8C4EXvmIAbRj4BjT5WXnuOSLLYU3ZpM_yDiQWBdekM0ERXYkiczxY
Message-ID: <CAN-j9Upy=thswORWaU+QxuO2i8uJKrZxcLpt5umP5QGRhpwqaQ@mail.gmail.com>
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93105-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mkoutny@suse.com,m:tj@kernel.org,m:corbet@lwn.net,m:hannes@cmpxchg.org,m:akpm@linux-foundation.org,m:shakeel.butt@linux.dev,m:roman.gushchin@linux.dev,m:yosry@kernel.org,m:nphamcs@gmail.com,m:cgroups@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,cmpxchg.org,linux-foundation.org,linux.dev,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 267B06B0B67

> ...but what do you mean by this?
> As I'm looking at the code in obj_cgroup_charge_zswap() and
> memcg_page_state_output_unit(), I'd say those are pages and the docs is
> thus alright.
>
> Thanks,
> Michal

Thanks for taking a look.

I agree that the counters are pages internally. I was talking about what
gets printed in memory.stat.

The internal updates are page-count based:

    mod_memcg_state(memcg, MEMCG_ZSWAPPED, 1);
    if (size == PAGE_SIZE)
        mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, 1);

However, both zswapped and zswap_incomp are memory_stats[] entries, so
memory.stat prints them through memcg_page_state_output(). Since
MEMCG_ZSWAP_INCOMP is not special-cased as a raw count, the stored page
count is multiplied by the default PAGE_SIZE unit and exported as bytes.

    unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item)
    {
        return memcg_page_state(memcg, item) *
        memcg_page_state_output_unit(item);
    }

Separately, this matches the existing documentation style for zswapped,
whose exported value is described as a memory amount:

    zswapped
        Amount of application memory swapped out to zswap.

Since zswap_incomp follows the same memory.stat output path, I think its
documentation should describe the exported value as a memory amount too.

I also boot-tested this in QEMU with the current tree and zswap enabled.
With incompressible pages pushed into zswap, memory.stat showed:

    zswap 87822336
    zswapped 87822336
    zswap_incomp 87822336

The zswap_incomp value there is byte-valued; it is not a plain page
count. It also matches zswapped in this all-incompressible case, which
is consistent with both being exported as memory amounts.

Best,
Doehyun Baek

