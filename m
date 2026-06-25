Return-Path: <linux-doc+bounces-93515-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ldwnMC4fPWo8xQgAu9opvQ
	(envelope-from <linux-doc+bounces-93515-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:29:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA26C594A
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=F4TlnSoE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93515-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93515-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C46303005AA4
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 12:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA963DEACE;
	Thu, 25 Jun 2026 12:29:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3603D7D6A
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 12:29:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390571; cv=none; b=fAOlExU40k3XqyyBRxWF2afIvuos5xDNEIoY0OdKViJaMvazjRv/dtHSdjKVcs314exMvTgRUJaN9OFBfR4vtdVwla+WSSB0PhB8fsaXz6m4aPJnFXsjOu4tsa9nv5P8+TGLUnoUuJVMYitLvuROsKW34I3kLHvocecU6VtX8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390571; c=relaxed/simple;
	bh=3qWGQWCmb1NDpRT10cYiXu/2QBAKtTDY15am2sDbjvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1nbVBjKzW+cG7ZVgEaIANFN35qano1VQhO5nlo15+2l/xA19eWOPjZ3UStondUQ7l7aTzfS8vb6q25BF+PyhewRBNENTfQeKNceDPkeNYT6KvQHx4fXMtKyAtk8X6pXkdfE5ScFdUfm6L2MqYNIOAvJ+TXECvcdSJAcnLopK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F4TlnSoE; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46e30429b10so257305f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782390568; x=1782995368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g2ppjyVbJYZltIdw6y8sH5RPhtFeQnjhQZPkfszvAoQ=;
        b=F4TlnSoEHiELmW4SFZQSUeQUmBjWOkPr1E3vMeeRTWSoBojq1cHUdWONJLNkV40hMe
         X7Zuc9taUrYvFEcSzePKYS6GyvZMPdlbYm5srrE5V3BqWO+WwPqlqc8ydo/YIHHFJwNU
         Ku1mBv8xEHsHlQo31bL37ekWRW3Rmi+vHcgKJIHO1YxeDzTGDD9N58eEKZ2fJpq2on6S
         OipI4xMXQiZ+dMKoK1l3F4HVeyDnPVEcgiudAz/LiECAe416i/PFjLtiYlgcD9+EMYni
         9M8oLeqT2ZcK6ngQ2Mk2CtWJ/X/p6VIsCgeLn0EGYZqWoWmhr1NtQX1TOp7loB2qKkLK
         YFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390568; x=1782995368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2ppjyVbJYZltIdw6y8sH5RPhtFeQnjhQZPkfszvAoQ=;
        b=VbKh5J2KLRLjuDlaQqav6j2UQTcbtk+K++Hn2T8Oh57GWi9Ch33Q6e76zjDC+9heHa
         1iFrI7BUY4jYcN1wQnXbu06duGH5x6ARdrsTgoxVBcCt3CMYQrBHDT6rgDtidBEUXd03
         DOE+X5adVs0113KJANUZLSiSX4lS1hukLC4y7nErdDGxWGlMPPolFrNgOSHpnucpD440
         whc+s8qfFdDbpVNGbWIKCPvaU9r252lQWtHOJ0oHKrpOcVvhaX3c9SWdjYax6lpPC2R1
         DidPrkRTszBLO/funwTNXEy/EQrwGfg27ieAPZQYNeH2AtYOvjxs7XG8BgIkZEhgFyDZ
         MeFA==
X-Gm-Message-State: AOJu0Yyz3PG5SUvCHHibgkDKmrXlmvdo2js425SaC4LlPxF63GxtryB4
	+wLdVhMOdHUfj8tQdBznd/9ZJQ0IGE13hoOa/5cPkb1rRwfOMtyBeb0VmTiexI9y9w==
X-Gm-Gg: AfdE7cn0FxmLFIRZqQ6vx7v8jXLkGCfrhxrqogTx+ePbj2Zi3J62LdUnLbB8n9JAn14
	Uu+RgEvJ+FrecXNN43E3qMKSnxogh/yEfupUKZvuk9xQrk1ipu+NkzRtoRYsBLFxjq0mbXI9Bmm
	DU4+xdxNPqRZK58BpyGFyj1VXUWlgnEDh2ZXXXb2BiZKAulvnaqF4b7ZpwW4z2f2R/Ur+LNUZmM
	1h8WbDAaAuRd0c9S5bwjOmTNvVRyktGP3phrRCb1ggZFFGxOHwSNFrQsFMSHTPwMQgPIxJ5o+Tw
	y9A4EbgmWixG6GwExRetpxkmyV7eoGhooY8VPG5Kd1I8jhuNeiUhTEXaPcA9xGZKnFxl1V+Qodj
	3Ab5kq95c+4rCFjKCL4Lv9pNTg9Jo5dgPr71cZdMRS5h6p7UwnXcnBgtibq0EWIca3TR3iLt9Uj
	9FG+LftfBisz4K7PAXU2/UQKgJxB4Btv8RsO0K12TAPRA=
X-Received: by 2002:a5d:5f88:0:b0:463:a7e3:9f71 with SMTP id ffacd0b85a97d-46dc0839c94mr3549517f8f.15.1782390567662;
        Thu, 25 Jun 2026 05:29:27 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:7a30:b9c4:b9c7:bc90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c2279b734sm15607575f8f.30.2026.06.25.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:29:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 14:29:21 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	Alejandro Colomar <alx.manpages@gmail.com>,
	Alejandro Colomar <alx@kernel.org>
Subject: Re: [PATCH] landlock: Documentation wording cleanups
Message-ID: <aj0fIbva9iaTX_Yb@google.com>
References: <20260516190112.4924-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516190112.4924-1-gnoack3000@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93515-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gnoack@google.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mic@digikod.net,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:alx.manpages@gmail.com,m:alx@kernel.org,m:alxmanpages@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gnoack@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55DA26C594A

On Sat, May 16, 2026 at 09:01:12PM +0200, Günther Noack wrote:
> Documentation cleanups suggested by Alejandro Colomar,
> which we have also applied in the man pages.
> 
> Link: https://lore.kernel.org/all/agW4yMK6CinJGqXt@devuan/
> Suggested-by: Alejandro Colomar <alx@kernel.org>
> Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> ---
>  include/uapi/linux/landlock.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> index 10a346e55e95..48c12ddf1108 100644
> --- a/include/uapi/linux/landlock.h
> +++ b/include/uapi/linux/landlock.h
> @@ -255,16 +255,16 @@ struct landlock_net_port_attr {
>   *   :manpage:`connect(2)` as well as calls to :manpage:`sendmsg(2)` with an
>   *   explicit recipient address.
>   *
> - *   This access right only applies to connections to UNIX server sockets which
> + *   This access right applies only to connections to UNIX server sockets which
>   *   were created outside of the newly created Landlock domain (e.g. from within
>   *   a parent domain or from an unrestricted process).  Newly created UNIX
>   *   servers within the same Landlock domain continue to be accessible.  In this
>   *   regard, %LANDLOCK_ACCESS_FS_RESOLVE_UNIX has the same semantics as the
>   *   ``LANDLOCK_SCOPE_*`` flags.
>   *
> - *   If a resolve attempt is denied, the operation returns an ``EACCES`` error,
> - *   in line with other filesystem access rights (but different to denials for
> - *   abstract UNIX domain sockets).
> + *   If a resolution attempt is denied, the operation returns an ``EACCES``
> + *   error, in line with other filesystem access rights (but different to
> + *   denials for abstract UNIX domain sockets).
>   *
>   *   This access right is available since the ninth version of the Landlock ABI.
>   *
> -- 
> 2.54.0
> 

Friendly ping, Mickaël!

This is only a minor change, but keeps the man pages and kernel docs wording in line.

—Günther

