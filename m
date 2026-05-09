Return-Path: <linux-doc+bounces-86609-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKVWGsgp/2kO3AAAu9opvQ
	(envelope-from <linux-doc+bounces-86609-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 14:34:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 107914FF9DA
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 14:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE8D03006111
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 12:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC8933B969;
	Sat,  9 May 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBjNxlXm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7762A19F115;
	Sat,  9 May 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330053; cv=none; b=D1hSxp8RIZbgOVX+2YLKb0LRU3XuI57EeeO/u8rTKwX1xJAiaRx6st/cU2Dm93YpjuMuCTwEuHQv3TE/rvAbwZsWEpI0G60VHC3CE6YUa+XPhc3RkxCKMK6M+kA8ZSpCaqwzxDz26xev16GCwiaGL0cEtejSHCFX4VbRHo3KZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330053; c=relaxed/simple;
	bh=o1MVcfKtmpDeiXWqeRLY0P9Es90DiqcqVTk0yDIPBoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdgyxfxxXBy++ztzSDQwtkfcjZJTbRhbfBlek4rwrO8DNXzwg9MgaCxYIu0awAxpm8nFpzqOTdPfJgzGIVe1IE7MipO9hhD/CDlGvErr9fKq5vcH6wzKO5H6jmfzMocj2nWQpDJUk7nf/Xk3Ljp7dnSvkg7aOclctoklDH+icyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBjNxlXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E47C2BCB2;
	Sat,  9 May 2026 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778330052;
	bh=o1MVcfKtmpDeiXWqeRLY0P9Es90DiqcqVTk0yDIPBoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBjNxlXm4CjQqKrt4lhrVJ5uF7MrzUMcUU0InFQCRlyk3oRpazLBGjg/4bmMTNpza
	 6m9o4Jf+AiboKHUoCPRPpxXntO9YMyAvNVCj9iF0a8Kj/L06qTq/H6iWYIDqY0fGWf
	 vqRhY+ccfOIFMFHhqGSjFI6CwwJV++6PTKASgGlgQrrZKkW/+9k11NemMXcs0IX4H6
	 KzLWM3RuAFAPvqNVuzRRNI9DLoywrVhcAsam4iqLnX+qdFMsAdGA9q+Xe2oLK3tBby
	 YZoD0VjiBHrKh51yquyoilHF0pnOboR+e+HROUdWrdJEQLXZ1m8Dq8a5DEXiMe4x0V
	 Pg521hmgt37ZQ==
Date: Sat, 9 May 2026 08:34:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: Florian Weimer <fw@deneb.enyo.de>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af8pw54Y-Q18kSR0@laps>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecjku6y7.fsf@mid.deneb.enyo.de>
X-Rspamd-Queue-Id: 107914FF9DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86609-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 02:02:24PM +0200, Florian Weimer wrote:
>* Sasha Levin:
>
>> When a kernel (security) issue goes public, fleets stay exposed until a patched
>> kernel is built, distributed, and rebooted into.
>>
>> For many such issues the simplest mitigation is to stop calling the buggy
>> function. Killswitch provides that. An admin writes:
>>
>>     echo "engage af_alg_sendmsg -1" \
>>         > /sys/kernel/security/killswitch/control
>>
>> After this, af_alg_sendmsg() returns -EPERM on every call without
>> running its body. The mitigation takes effect immediately, and is dropped on
>> the next reboot -- by which point a patched kernel is hopefully in place.
>
>Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
>with typical Secure Boot configurations in distributions)?

Yes: under lockdown, killswitch has to be configured on the cmdline. Runtime
engage is gated on the new LOCKDOWN_KILLSWITCH reason.

I do need to resend a v3 that also gates disengage and the retval write so a
cmdline-installed mitigation is fixed for the boot - I didn't think about that
scenario.

-- 
Thanks,
Sasha

