Return-Path: <linux-doc+bounces-94682-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wY+pFUCrRmpDbQsAu9opvQ
	(envelope-from <linux-doc+bounces-94682-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 20:17:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABA6FBEA3
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 20:17:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=WiujR1wL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94682-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94682-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F22A83042331
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 18:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4975E3A5438;
	Thu,  2 Jul 2026 18:17:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E9A39EF0F
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 18:17:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016248; cv=none; b=lNzLEQhgAJPK7Pf8aPOOJHzSbNIV7dW06pvvbngPLzdWLLJ6l3GtTrj7xmLE7616NVDDOcHNiXC5CEnFyuAgymgHExdhSbZeADJIaVp1ODvXXhJ0VBcIBqiUrYesAqo90XrlngnTlNb08qf1q4M7q72trQTCtbWXcehGUiNVDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016248; c=relaxed/simple;
	bh=w3OVr9Po2XdUECAx2SJxsEXHuwRR+XanFttuesd63UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpPbABEzjtQeVkiwMdtdhuPuEtovNQiN3ou2sMLA/yIBJBoEyFZ8QYmDgfgmhSslF8Axa1GvPlfUj+8Y6Ws/u1vJIzgggWAuhevsRiMZ+xmQcOnm8u34OSCDrv/eF9ktwbcS6gAiIGWKrYxNOTHpnL4KdRdUwvF4K/e1KGJkzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WiujR1wL; arc=none smtp.client-ip=209.85.222.169
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-915ab38ac14so194330085a.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783016245; x=1783621045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BkwYUHUs3DSbCk8wCkm9DtFHy390UnK0AksZfeOtqa0=;
        b=WiujR1wLkqEhfeDc5P6P5NOKSwqcWPsYhoBVvekhwCQ2RwfmrFbmuPEotj4PQ6dkG8
         E/WeJb5FRxNo5mubxpgZz4IVP4KynnZTqHcNV/USky7VztxP9q8EsYzOoGfRjab888vy
         oN1kPpphMSk+qFT1Eyw2KhFgtMl0aAtmFz5fqgaAukjQhTqHdcZzbwiAmWPsa98TetZL
         uS+0voJqiuk0F6WRyrCREr1gVgWoGoBL7M4cMvukwMHiBxjwR4J8UvJArplv+NOtadPj
         0W25ZT911X6q6fTPuqPDFl75WG8XyC5P09EJa5zJIscZDTAfquN+vwQhgPsgFS7A7mNv
         mz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783016245; x=1783621045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkwYUHUs3DSbCk8wCkm9DtFHy390UnK0AksZfeOtqa0=;
        b=TAdR+NGkTBw+4Q8d0TZ0KQR9zLBNXmkghLTw+F7IHqAnhWr6IrRtaB1yNks9R64/Sd
         BbmPmjzpQAF3acoKe5ad7+71qDhEb/1UtF6/+/KWZpfVc2t0VOP5+82Mu9X0LXxXkfy3
         23E8uYaH5BIj3l18Mf+HYSVcYr2N+4xDJsbnq0XUnJbTecU/NWxPik4XcQX5pHJ1tcDz
         /3S/YhZ0YdorkPfxvjTh/I13v749zMcGd5OCFe2rQzVnhdQNcD/9LAG6gnz6nZ2vKdH0
         B6G5Jt+X5GSZ9akNaghEDS78X389qIYX9L4rDk/m7xP2PcnPGQR3T6dvf1tVmZKdfdrt
         jI0g==
X-Forwarded-Encrypted: i=1; AFNElJ/cYB3I0jCujYBf1kStCyvltMdoMfbTYtfIY99l0TQtI4aOLi4m4+B10bxd5W+oHaUfrAlO5In0kk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERMAdnabLAeamYntWZSJoHo49et28IiDxrahPB4WFuxr5yV56
	x5uDEdijE6gO0+yJrU05GnBRest4HqRbqK4lEhmbo+Srtzo3VVOKpJk77Iz1eXstgh0=
X-Gm-Gg: AfdE7clvV4x8t0kg0lWQrYmXBlltngepzPRgu1ip7FxHWyZ1FFIAcnR1RyWoxqiMof3
	ocRGoMNAGuIzfHm195CgygXS8JPePBXjZUr+0RUPPEof/RSc89Ej9CgOxaKnxJBEJ/9mp4ur51I
	XAVhKbmfVrve5u9lmD+5sPP1vLJu+mHZdfUAoJauqgnpqAzdyHR0eVoNnW3ucLMi5TIUP9oo7LN
	OA6d43WpDn0Rz3YacBkapzROSLe5ZEJUeEvENpRbYvb9beJpQl331JE0CIeZP2ONaFWTvWyz1Gj
	MXOCyIJ8OfdHTEZCVdSIVhfZrJqbDXAiz6cJ9BrlGB2QJuO9DdEodmxED8xe4qx/z/JbHbK6Zah
	2NPmfM9GdvELpIJMENSFBT5f+FK+a6AdCbmAmIr+4xAPEIMREyb0tqVyyFD0TncJmDihEhgOOU6
	SBVqZ23y1FRIWouZWdZaElbkfmeYGLjvoQ58lTa7lHYlZkbcXU4/C97FUJ63QKuoPpzqc=
X-Received: by 2002:a05:620a:bca:b0:92b:6805:918a with SMTP id af79cd13be357-92e7851c58amr1082989385a.66.1783016244610;
        Thu, 02 Jul 2026 11:17:24 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4722ca4c6sm32096536d6.39.2026.07.02.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:17:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfLyV-00000006QKg-1pc8;
	Thu, 02 Jul 2026 15:17:23 -0300
Date: Thu, 2 Jul 2026 15:17:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
	corbet@lwn.net, leon@kernel.org, ljs@kernel.org, mhocko@suse.com,
	rppt@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org,
	surenb@google.com, vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 2/3] mm/hmm: add hmm_range_fault_unlockable() for mmap
 lock-drop support
Message-ID: <20260702181723.GV7525@ziepe.ca>
References: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
 <178301356964.373695.14274584821659522979.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178301356964.373695.14274584821659522979.stgit@skinsburskii>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:skinsburskii@gmail.com,m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:corbet@lwn.net,m:leon@kernel.org,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-94682-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid,ziepe.ca:from_mime,interval_sub.mm:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DABA6FBEA3

On Thu, Jul 02, 2026 at 10:32:49AM -0700, Stanislav Kinsburskii wrote:

> + int driver_populate_range_unlockable(...)
> + {
> +      struct hmm_range range;
> +      int locked;
> +      ...
> +
> +      range.notifier = &interval_sub;
> +      range.start = ...;
> +      range.end = ...;
> +      range.hmm_pfns = ...;
> +
> +      if (!mmget_not_zero(interval_sub.mm))
> +          return -EFAULT;
> +
> + again:
> +      range.notifier_seq = mmu_interval_read_begin(&interval_sub);
> +      locked = 1;
> +      mmap_read_lock(mm);
> +      ret = hmm_range_fault_unlockable(&range, &locked);
> +      if (locked)
> +          mmap_read_unlock(mm);
> +      if (ret) {
> +          if (ret == -EBUSY)
> +              goto again;
> +          return ret;
> +      }
> +      if (!locked)
> +          goto again;

Why does this sequence make any sense? I think the caller holding the
mmap_read_lock() is some historical artifact, shouldn't it be pushed
down into the hmm function itself? Looking at the callers it seems
like almost all of them want that.

I can't guess why drm_gpusvm_range_find_or_insert() is mucking around
with VMAs, a hmm user should never do that. I think I gave this
feedback many times.

Also, why the goto again? If it needs to loop again it should return
EBUSY.

> @@ -715,7 +804,7 @@ int hmm_range_fault(struct hmm_range *range)
>  	} while (ret == -EBUSY);
>  	return ret;
>  }
> -EXPORT_SYMBOL(hmm_range_fault);
> +EXPORT_SYMBOL(hmm_range_fault_unlockable);

Don't export new symbols without adding users please.

I suggest you add a hmm_range_fault_unlocked() instead and convert the
places that can obviously use it to use it.

Then maybe come with the unlockable version with an intree user and a
strong justification why something needs to hold the mmap lock
externally.

Jason

