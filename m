Return-Path: <linux-doc+bounces-92419-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id asqeEoleMGrjSAUAu9opvQ
	(envelope-from <linux-doc+bounces-92419-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:20:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D7689C8E
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:20:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=OlBfhli9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92419-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92419-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D043094CAB
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 20:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5FA3B530A;
	Mon, 15 Jun 2026 20:19:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F473AFAF1
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 20:19:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554785; cv=none; b=UxHtTXIWLZxlbO949xMSwCYSJW8Jqm6IrBtRQSb85DtQIL19Lo5XwcsQ/HBd+PDAipEQlZ60ipe8/tOWUP7rG7SuS+9aCn1rUylIhxA8fmqhBo9dNjneG/pEsROmR6cz8gbi1Eo+z/PcbP9HRVAlTG/X2j13VvWBH+RhPFUho2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554785; c=relaxed/simple;
	bh=061ZRpXOvpEUBfQoZbaaLWrq4ZyrfP7xZUXohlU6zt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0ufrvBAuTLIVxG406P9TzhjDIctYky5CLKmdZy2kd0Ei2gnbpefiwjTRN61Nby36mW47jsSH3XCQbQKZk7wOsleStS+RWW1Ncnh0TMEaNj4ZTL5zLDIXKWJxs3Fz+tnyq+ukRa4lqOX9D799FOcSv6nI4RrhCEa+6C0PPrM8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OlBfhli9; arc=none smtp.client-ip=209.85.161.54
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69de16f5f79so2069293eaf.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781554783; x=1782159583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62CFI3r/uqAq54jIdUJdPm0vilsCjqWfRG5bIQ6BFms=;
        b=OlBfhli9HS/irnPOvqtCmZMwLE/1QFPVrzjc0fcCNOtgDfmZV7sZr1daVDzSC3I5Dh
         MkWvlB+kzGyP38OBJEWpgmMqSq5mFoqkRb/Nugu6FdzmC1ijk1PL6Tlfg+uYYzn4FVcm
         3OemZpSypRr72VX/jxAgftjMmJ0ykQqaQnreopTNVAjuifY8rJWqj/u6sov/ko/BN5j/
         FBTkbQFc9Qex/pQQKR4AtQXDLr5C4lz6u/3XMo43hIxhTZ3FnQd2dwgT28oByr5zQW0o
         zlxDG+rg8Qw5MsMMwGVtV6+z/BeVFsDTBwwTv9Du0dObieJMP4degkMB3T3AWUa5lHhw
         drRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554783; x=1782159583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62CFI3r/uqAq54jIdUJdPm0vilsCjqWfRG5bIQ6BFms=;
        b=An/Nd2KysI3h7d3aznv1AeoVFzqeD6epQ+bCnmoM7mrrHl2rBeGSIwFpuZXkKiy7qA
         3zh/AmspNUKgzUJi2XUN2QvKTeBXlJ8cWHtv8/3Qgu7LghejczI8qbJQAh6zdujlRRuq
         i+h5QX3HmzvY6v6CXegmS4xVlf6r2zm02s2TT03QWF1SysUmywLJQ0inWaVgjUmW+uxG
         pg4eTxN+M4OY8ENcgsVO2XQCHmdcwE3uIiPZDxGGixtoYaF3O8nalE5HyL/b2Z7l2THX
         lIsodGFa3SjvJBz/R/obJ6qJcTiW/il6WFozVXsmM6Pjkahhk1hzz7wxtQcFexv4BkP/
         m1Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8IAT6sRRyCHYFJOw8B+/Ed2ZE1DvcNhUMACOQJjOa4YAA8VNiM6e9KW/uGIxBCFcTVzRd9es1bdDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6riZ4lFa0Fh4Hlsaq9cZ2xz0HHcdKjCt0geFtwPPA9iCzfNvt
	gNZtpqitFagAPzdC7i+LpQVB3Ld2MSKL7UlrdQB+F1KV0j7CCp0VOvRs3AEYgwGofQ==
X-Gm-Gg: Acq92OE1M+jMzhQirIxP98IUMAS9+XxmWCi0ZUojvC2qGlFTWdYwwWt5JTYuIaMHx+n
	wiOWzsGeFWDOZi+HmJgkROB1qxWeWWF/VIGLMQrNbACMFQt+I0scKD+Ipd4TqRzpk3pjMpL6FF7
	HTg3x+uqwfN4Fj+KRq3jbvvuU37/m4pNdJi6K4OCdhkSvw9PiQWnVV+1zBhsB9PWBhOynAsruMS
	iOgiF6HDYoybWORT7MFzF5eb437pOFSpNK4qScC6QdUvcEDtr08Fr3GBk2X+X5pqBefoT95nx5m
	LXpGIjo+6S2Pp5C0Pw1geeNf/gy2ifUftBJAuAVgAo4PRORg5tnVd0qu5kYNQWRmmxK/caRonqr
	N9fhW4PfcOZKBcsWiD/YCgTh/7AK1kHMHcXqX86iYV2fRz/zzjbXp7X4dnvh1TR3PQhsZiGJlox
	ikIpxEPWid3OrHcWk1EfLPnplXyhOObJ9VHdlnpvc6+arqM43V2hLuqh1r8B4pUie50lHd
X-Received: by 2002:a05:6820:8187:b0:696:1a25:fdc9 with SMTP id 006d021491bc7-69edc6d452dmr9662928eaf.28.1781554782286;
        Mon, 15 Jun 2026 13:19:42 -0700 (PDT)
Received: from google.com (57.221.30.34.bc.googleusercontent.com. [34.30.221.57])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00f50340sm3679813eaf.13.2026.06.15.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:19:41 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:19:39 +0000
From: Neill Kapron <nkapron@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org,
	Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 1/3] usb: gadget: f_fs: Initialize epfile->in early to
 fix endpoint direction checks
Message-ID: <ajBeWzttjurOKGV0@google.com>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-2-nkapron@google.com>
 <2026061533-oval-buckle-b90e@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061533-oval-buckle-b90e@gregkh>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-92419-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:paul@crapouillou.net,m:christian.koenig@amd.com,m:simona.vetter@ffwll.ch,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-team@android.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 972D7689C8E

On Mon, Jun 15, 2026 at 04:30:49AM +0200, Greg KH wrote:
> On Sun, Jun 14, 2026 at 06:10:00PM +0000, Neill Kapron wrote:
> > 
> > Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> > Assisted-by: Antigravity:gemini-3.1-pro
> > Signed-off-by: Neill Kapron <nkapron@google.com>
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This should also go to stable, right?

Yes, I will update v2 with the Cc: stable@vger.kernel.org tag.

Thanks,
Neill


