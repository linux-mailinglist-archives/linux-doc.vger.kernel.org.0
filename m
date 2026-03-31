Return-Path: <linux-doc+bounces-81915-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Pd6L7c4zGlFRgYAu9opvQ
	(envelope-from <linux-doc+bounces-81915-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 23:12:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9452371705
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 23:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49AB8304BCD4
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 21:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67573F788C;
	Tue, 31 Mar 2026 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ERxk3kOP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D81450910
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991308; cv=none; b=lJRWX2QrlG5mpQKPQeBQwSuy7bX7NVrPZEkJ6dpmJX70/fzcvz1JlWgf5akXLSrjM1Fj4UCI73DOKDuT0Hdwwo9yKB+wnVupKGZ47DJcxz5xSDvF1DgYAjS7p/p+I18reep1GJcDuo/75ArupBaGZblM66WSte/TCimSs2zC0GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991308; c=relaxed/simple;
	bh=HP+l1uTCqRajs2Vn3305m2For/K7wm1ErxgzeVG6UEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdr7dugvY9uwHBWU9ThLhwqH/cpFaz/0y4eZn+tBZWknRIzPr9zm0zAqxvTSvEZFOUgsR3+GO15DEjnYDjkr7wQmgcVyBBnYFvbsNJYWBq7gwzdCeDJEznQ+zXG3VZ+tSVo2ZjBF0PLMZyq6zRT4TK9s6gIRGOAFeUC3NIrY184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ERxk3kOP; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d7f09aa39fso7517398a34.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774991304; x=1775596104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP+l1uTCqRajs2Vn3305m2For/K7wm1ErxgzeVG6UEk=;
        b=ERxk3kOPtb0pgZNrGP3Mp+B+8cIgtEwM0R7DimHTXkGvI8/GCwf0SXF4hk2vRoY6dI
         P8+xwvOWzbzQI9WBbiAkdGT3wxIXtqySaas9WG/n09PvDGSwoq6/SwdWeAXtz2ozTOdH
         Cr4MMmvzi7YjeB++O8azhH9waDMngD3Dhycm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991304; x=1775596104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HP+l1uTCqRajs2Vn3305m2For/K7wm1ErxgzeVG6UEk=;
        b=g27OxKKwz9TDFAkEMB3mDaAF4ekJ0DWzBXnUhfiWBe6sYi/YAIzOEDj3iyGCHzsgFI
         +8HOw14vx2PFGJu5SSSk+vL0Mh6PgBQfbmS5vw426+cQnhZosxzusaCS3tIzGO+8Y8V/
         qv6rGgUck9WI2HCtBStvi1e1XpemhGDpBrk2MFgmg0e3QDIDkcuIFEtB0lZ0bIjtnPY/
         co581Yw8o/QIQAXNN8qnH6ABjb0gBruZ7n/TnLDZVX0iTDfW4Mk6YnSsCHfd64S9PN4u
         vBCtldquWOSp+yUoPiE9wU3pI6RNbC559uuDm/mo8FX2tnRMM4gFOO4fXYy6i4JxDolC
         JvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQdugV1lkGhFKNBOz8g+5edjBXrhmKxkd/s0smoYG7cbFf8M8vQ+1pBGCE98OZDGfTICoqhZ81ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZar00mQRF+bd9XQCMUA4GOlVu5QY7wIgv2VbQkPNGBzLSEFNn
	8dMiA3uBv/Ghgk/adM33uWyl/UStRpurYqss3xpW5qfJ5l3kUbVaBS0sYJJDQW9Dt9I=
X-Gm-Gg: ATEYQzyhvhwcaTu/Sj66V0E+GBEzfITG2W0S9bEAkvDIlpUERg0oEqW/8LLaU8Wy8KA
	Z4kRuMW+FcHW4jlgfTwNlxZ93ZNDL22Qp1ch9okesLMc/Bs6c65wCFe2cMPDSk50LnIGdMFSfbJ
	rms+dnUr777c1N2C+y2RKo1lzRMMuXagp7J1aYpHfljHlK6Twus9mhLc2qxR10gk2Mrz1i8fEUB
	o+tB9eMzQJKxk7OaIsMEDXSs7tX9IXygkc7Tmgr6Iuvi+be1bpVhjUwf+rkYmYna6RvCAltcrZU
	qZW6wEPkoxXTUIWqReA2l9ZZbQ9C/yCwOE/zeqH2oGZzD9DnilpfTrbevHE2nojRe/Mi3KpNPX9
	fNvHAtymCeE9qUCMhZ5hG+x0GxIUHQoiEkwTfVSh/YlGvUGrdpx2bWaqZXnlLd+Na3oWlwT00qL
	mJ463gzN9cBfuCHPyW4jPXGaA3v4TmxBkYg3k=
X-Received: by 2002:a05:6830:82bd:b0:7d9:7201:1acf with SMTP id 46e09a7af769-7db991d3f6emr827760a34.5.1774991304319;
        Tue, 31 Mar 2026 14:08:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336353sm9005534a34.2.2026.03.31.14.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:08:23 -0700 (PDT)
Message-ID: <caa4ab7f-81cf-4a0b-a8a0-1c12641cfe2c@linuxfoundation.org>
Date: Tue, 31 Mar 2026 15:08:22 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: octeontx2:Fix typo in documentation
To: ShravyaPanchagiri <shravy112@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
 hkelam@marvell.com, sbhatta@marvell.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, Shuah Khan <skhan@linuxfoundation.org>
References: <20260312162715.35408-1-shravy112@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260312162715.35408-1-shravy112@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[linuxfoundation.org:server fail,sto.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-81915-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9452371705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 10:27, ShravyaPanchagiri wrote:
> Correct a spelling mistake.
> ---
> v3:
> - Moved spelling fix details from the subject line to the changelog.
> - Simplified the commit message.
> v2:
> - Fixed the subject prefix formatting (added space after "docs:").
> - Moved the long description into the commit body.

A few things to fix in the patch:
- Signed-off-by is missing
- version to version change information should be placed under ---
below the Signed-ff-by
- Check submitting patches documentation for details on how to
submit patches.

thanks,
-- Shuah

