Return-Path: <linux-doc+bounces-92956-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WR3QGIdtNWp2wAYAu9opvQ
	(envelope-from <linux-doc+bounces-92956-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:25:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E06A70B3
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:25:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sN6u+anA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92956-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92956-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C697030027E9
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C3235B125;
	Fri, 19 Jun 2026 16:25:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145593BBA0F
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 16:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781886341; cv=none; b=OBjy57Ilm/wjy3PsuLIJxF+zDkDZpyi9DDu5AZe8vMKR8x8eSaRga6Jw5/+ho+XGrlG5QiXmFaq6caLl/PdvVJX9YJJQFhhuXt9+FNgXe1vV/zvODv6Nc/bBXa6uGZ/9m4VqMoaXmN4qYVN9HGpQ/hWJ58WA780s14BPXFIOzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781886341; c=relaxed/simple;
	bh=xwDfAZHsXNJZKub5tVht9rcd+GBNqMkACx5rfm9vMvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdjssgNHot+dDF3kuyckVN0SlaS3XZq7g5RiIL5nOfrLwcHlP1lAWEDYTREZTyoDoaW+pwIbGJslcZAAW1AkurTHwQ1+0hhekzd/RaEPqL8YLScvvd/aw5cHml4z7+pl1z7tUJifTzJks33OG4wiNoOMBlhelhq1Ftl8i4jXuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN6u+anA; arc=none smtp.client-ip=209.85.210.194
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-845385adf4cso1117498b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781886339; x=1782491139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHKKTVKe4lqrizCPkBh4MOSrSv/TPyv53d0znlQU7qA=;
        b=sN6u+anAvSPbdZVAWcCDk8rVZbPCZj+CN6ssN1x0Dqkb86NwGKsEqk6tWG82IVPsIW
         33TUcPNjblu6s/3zlISwzK9Z10I6Dos4VpoWTL82O5Jlr34aJoHdZy8IJ9XigCHjQ3xB
         bJX2UgE1W3JPfXNsI5KEdoIrg4nyEviJWGupyKU09qT0Jk+8ubupPKIXpEMKX5FzgM4Q
         BeFK6T6JqMyyBKANn8TtulCNv/4qPpf0MYYYY9oAAKnjNRnk8vcyCqhk49q0fK2s9Hi+
         GRo9MVawK3CAY/GrHkkvz+u/Jop37QY1xknzYxOhh9Y4is7gsqzwy2WYFDmtGU7GXh9t
         TyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781886339; x=1782491139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHKKTVKe4lqrizCPkBh4MOSrSv/TPyv53d0znlQU7qA=;
        b=tQA8oeZwNy8RNdmYyW0DFVtCw/Bd4S/MyHCScMGrt+I2jpCooRlFr+1qFx6itXtPFR
         CfNe5oIHMAy56axUY8NrHo3ChsywqZ9PcRECWItubo8OdNP7qbGS75y3wZLZ9qimX4fC
         IDmC18heD6F5MlNdjIH9+/iBKr3RBnwRVGzE7fygy+lFKKChRnPTKWa3TwIC/litbZe5
         khKKuSYaJwwWs/yzctj+fe3Jh08vIyNIhaF0YpHd/aib7xD16+rePhpMHXVTywc0g6YC
         YhXTuUVmYHJHoD29ndLdi2Ya5my03FpCeFv4FzTNOoZyZ1wmCZ4nGz1XT1IWphUsWNDG
         gV1A==
X-Forwarded-Encrypted: i=1; AFNElJ+q2QkOUn7H1MiP6Fu43kv9Yv/AaDy3xTqVal3PY9Jr5cNS+BlcQlG5CotKaMZ9KSnOmnD1npEw8ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK99hybTkRLY4En0zOCqObHvPsbNMVtmPAxVC/pu68hSAXAUgw
	lwLavt4rEGPgfe+0ss+/8EH7f4z+SvH79M2b4uNd+Cxq+S1e/q6m0D3NAitQCD0jzwLjNijC
X-Gm-Gg: AfdE7cm36scgq9qGJHBUb2f9FiZ5ri+nP9/P62+4SvVPNhl+ucz+E0t8PqseiO1oVG/
	Lb0dR/HtbbofDG5wda9bkKldbALun9CqK8IT+dL0OXRTaMe40k6NKbuvadKWYuRFThC0mAdBDeD
	K3/upaUZ0BwjOuPXLu004DFxEwitbWZhqypM/ESkfZqMKO1cJgXtdHvhKdY+gRgigjvSZKbYXt/
	Jd7V3nKz6NtvvY4l8k2OgrTaMUSSN94om4x6SP1MN87EDFAKMeDmvX/mwteoVJ02Dp7RFLeq1Ry
	OLW/4+GBz3hmRtoR7hTSe86CsPQyHF1ZLubXdM9pK5iuvw70rRChuEMpibWL08XOOvN1HcFIVfm
	dVo+/R/GHCbpKskBvpAM+QE0PpvW8nYqLQuqtk8HgB+ieUKwURFhy39OwBFldi7kmSlm67h8yFr
	ZaCK6QRGVZO/QbjVgciB9IfBEdhlEaNPY=
X-Received: by 2002:a05:6a00:2d98:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-845507f9567mr4688650b3a.20.1781886339387;
        Fri, 19 Jun 2026 09:25:39 -0700 (PDT)
Received: from [127.0.0.1] ([103.142.140.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455366ec53sm3015386b3a.13.2026.06.19.09.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 09:25:39 -0700 (PDT)
Message-ID: <e94bc823-0c2c-4cf4-8a17-a31e60fb77fb@gmail.com>
Date: Sat, 20 Jun 2026 00:25:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/zh_CN: add process/changes.rst translation
To: Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
 <20260619140245.1982921-3-qiujiandong1998@gmail.com>
 <87pl1mtxqc.fsf@trenco.lwn.net>
Content-Language: en-US
From: Jiandong Qiu <qiujiandong1998@gmail.com>
In-Reply-To: <87pl1mtxqc.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92956-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C28E06A70B3

On 6/19/26 10:23 PM, Jonathan Corbet wrote:
> Here too, we don't need this label.
> 
> (Yes, I'm quibbling on details because I am in no position to judge the
> translation itself :)
Hi Jon,

Thank you for pointing this out.

I don't think this is quibbling at all; it sounds like a good cleanup to
me. I was following the structure of the original English document
closely, so I did not realize that these top-of-file labels were
something we should avoid now.

I will drop these labels in the next version and just refer to the files
by name where needed.

Thanks,
Jiandong

