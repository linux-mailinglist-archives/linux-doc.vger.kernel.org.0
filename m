Return-Path: <linux-doc+bounces-87383-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFzaI7+hBGqbMAIAu9opvQ
	(envelope-from <linux-doc+bounces-87383-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 18:07:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F7536C20
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 18:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 263AD301B535
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310354BC035;
	Wed, 13 May 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQPi83Gv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CDA4ADDAB
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688284; cv=none; b=UPslDjtvh7EkrFCAoV5L1R6wyv0mXAOCb61k0C7Zcy925m0oqSEMgREULvZJ9Pab4e/IatCAKyRTyiMSmj3xYTrBh8H7+giYQQQm8/3uiEHkcNS2a37GVEFTBOb+KflHD3uNJ84sbq4+fL2zdOZdxh8Mx9MeOX5UpnTC9pSV/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688284; c=relaxed/simple;
	bh=/Mw2VXeP/MP1Q6d7A41y7KvzQ5ld22kJAlb0E5YYacg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=OgSCiyCgASTrUyu5vlcrJlS4mmp9eU7AUDtj0W8JrF9bFsupM6qwM3sAjpo+D4ugA+MgnA5JW39HPFgYaAjoiFPVYIqCJ5URmXOSTk1z+TOMdAOHX5jjoLPIuMUgyGvdOFCmA63zVelg32jNc9ep/YjJ4pkTa3pxwy82BnpvcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQPi83Gv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd2e8931915so362273066b.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778688280; x=1779293080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sGimR3ZLCeWsaBfTc/DCA16/H7/+orEZfvmz/AUwkQ=;
        b=DQPi83GvKPkB4cZE3C2e3J5zQmPvX3QZ2eM7h33D6VA80aqIGmrgpUp6f3jaUbm3yQ
         8YtLXM/JIb5A99brcxw7w6xx2PDhnYRS6KiVQByN4y+/ecRWpWXmg/p0XpBaNb1/9jys
         EdQDz3hQNwOOAOayPn4g+7vRGVbdGtGAk3ZNgGG9KsdbAVmZpn91Woxgg90rQOS/qNjt
         3Y7WselBl3qG4OstK7ODv9Sl23RLLjLa4pcbM4eAElwytuf6VVEpyk/UXY+HnQYWATrJ
         BXCTLqolMbPHU4bvgPfc8gBpohKbjJUl3ckRPnIn4TQXcyyiLf4ll1nE4Ga6jcQtvmR1
         kokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688280; x=1779293080;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sGimR3ZLCeWsaBfTc/DCA16/H7/+orEZfvmz/AUwkQ=;
        b=jwjAXV9fbKes7tKhstggfzyUDqrykPCj0Yi75IEqMuhjtSP1zZ2mTtf7hFHFLB+kII
         bznhgUAMTHklPgFFLu4QErOLFFDJQ917p4KfrPYBeDffpXBhuUw/Bw8Ot324+aS64KPi
         Xcfc7Lw4y+jUffhf5f+MiuRBZQAQYDex0AKEmJP/h7qMacY5X0sXmSStIr11f2CG2ylo
         6JQc7SOtFEdmnAjH7TzFNMHOz4tShuk6309DD1FT5XIwISCescOG2ilnJiMwmV1XoAQJ
         wf6ejnB4j0G0lyZK82cwR6bBzONh4WGoCD+8OvG4yKv6S58nS1IOneIgrniA8rTzkQH0
         TmpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pwnKxOslYwwObCtBJBTJKaellA9uO3usW8CWReosiMPCCUcYXpIQqk/4IFinoDSMOUCZD2uA34Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymdt3KmI46hpCww1DUMYLkeVYsbpj2OhlBfJAtfZhD48IDeq+Z
	zCnBbns5bsd1gTggPD/ecHePC5PsHdgWGfKYQAZ35zY4HmecpjAB/1RI
X-Gm-Gg: Acq92OFbj/NDUHIKggcKr1/OXIr4+NlresTSQnanayMTJ3jz4dAaBTgeas2pWrUWga3
	wEbGcHqSBhx+29tvFluX9Ui/xSvRxAOip93wb0R2DU8GawQrjU+VGHcAyaKDwchlFgNqRQPOSjo
	UeSFypHETFqxsuBRW9sDrZm1oDpWo3BrWVe5fz1LJ9SscTaqJ7+mJswPd4bJ3SubHapvQ7Q542i
	ErNc/I+qOBjkaGtMqqNwce72//7dSiShFA4EUac7joUa99cDMxVVWjhn5hPJnjGjAm7W73nvhIY
	7Ap+KVCpUfz13VLUAyUC+jmbR4knBQEjd3/hkm0gN1DLHsuE0kiR5nfz4Q3OWQEIbYY5sWm5a1u
	erE+H+MZIxoBTqumo8r8QKctBypFe7Z17SpCmfr02qdW15UnCV4nSOvttzn4BscrL+2UCRuRISK
	/76s78VftmHzTxmwtj/wtxqVJV1SjMTDLiQfe3o5PbWoeoIKNQJkXS0rcOMIw=
X-Received: by 2002:a17:907:9614:b0:bd3:99fc:5610 with SMTP id a640c23a62f3a-bd4f3503c54mr8054566b.30.1778688279619;
        Wed, 13 May 2026 09:04:39 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfac35c47asm522756466b.1.2026.05.13.09.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:04:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c6af41c4-5bdd-494b-bcc1-550957c456ca@gmail.com>
Date: Wed, 13 May 2026 17:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: nathan@kernel.org, jani.nikula@linux.intel.com,
 akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <agSXOHvQqTxSsArW@levanger>
Content-Language: en-US
In-Reply-To: <agSXOHvQqTxSsArW@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F9F7536C20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-87383-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 16:22, Nicolas Schier wrote:
> I guess the github branch is expected to work out of the box, but on my arm64
> system this fails with:
> 
>     kconfirm$ make -j8 kconfirm
>     error: no matching package named `env_logger` found
>     location searched: crates.io index
>     required by package `kconfirm-lib v0.9.0 (/data/kbuild/kbuild-fixes/kconfirm/scripts/kconfirm/kconfirm-lib)`
>     As a reminder, you're using offline mode (--offline) which can sometimes cause surprising resolution failures, if this error is too confusing you may wish to retry without the offline flag.
>     make[2]: *** [Makefile:17: kconfirm] Error 101
>     make[1]: *** [kconfirm/Makefile:2244: kconfirm] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
>     [exit code 2]

Thanks for giving it a shot! I will look into this.

> and if 'kconfirm' does not need a .config file, you want to add 'kconfirm' to
> the list of 'no-dot-config-targets' in top-level Makefile.
> 
> 
> FTR: the 'kconfirm' and 'kconfirmclean' targets need some love: both do not
> really integrate in kbuild, yet: 'kconfirm' is not working with out-of-source
> builds (O=...), 'kconfirmclean' should not be required if 'make clean' is
> supported correctly, and 'make mrproper' removes the whole scripts/kconfirm
> tree due to the change in 'scripts/Makefile'.  (Tested?)

Also thank you for the makefile feedback, this is exactly what I was
looking for.

> The large amount of changes has been mentioned often enough;  even if all the
> vendored dependencies could be dropped, I am not convinced yet, that it is a
> good idea to maintain kconfirm in-tree due to its project size.

It's true, even though kconfirm only imports a few packages and is
2,000 LoC itself, once you consider the transitive dependencies, it
really adds up.

I'm currently trying to shrink the dependency tree as much as I
can, e.g. taking advantage of expected system packages, as was suggested
by previous reviewers.
> IMO, we need at least someone who steps up for maintaining kconfirm and
> registers in a dedicated MAINTAINERS entry.  (My own rust knowledge is not good
> enough for appropriate review, I can only offer some initial testing and
> frequent use when it is working/integrated.)

I will add myself to the MAINTAINERS for this. These RFCs are only the
beginning for kconfirm, not the finishing of it. My ultimate goal is to
be able to detect _all misusage_ of kconfig, while keeping zero false
alarms. I haven't even added the SMT solving that is needed for
path-sensitive analysis and detecting unmet dependency bugs.

Thanks again for your review!

- Julian Braha

