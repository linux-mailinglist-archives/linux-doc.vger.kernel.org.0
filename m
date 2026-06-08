Return-Path: <linux-doc+bounces-91355-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 84j6EyKmJmovagIAu9opvQ
	(envelope-from <linux-doc+bounces-91355-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 13:23:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FD655A40
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 13:23:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y5oZQ+9c;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91355-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91355-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C8AD3019094
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9015233F390;
	Mon,  8 Jun 2026 11:16:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195D34F247
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 11:16:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917398; cv=pass; b=d7w2yNK8vC0akv/YZCGlTK7MkgBIrzJUUYqsTR/UinA6b8o+DKccyKc/+X/xX13wvxSzWDrVJykp4MC0rlaxIqOLzFKlJANBCl0EQFX3ZBo46qVCekpx6Ap8/zbuCrdECuWDDrh8fNGXCipYkTbDTDVcJ3TjYKhSfDiL34uNIkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917398; c=relaxed/simple;
	bh=xF8X7w2g5DmOlj4MXnYATcTrIzjqSrR6buYQGHCicdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkzrpgvxaJX8b499+QmcEs94VjGFCvfI/KkwXACd0vLXDgLgfRmDOikxBzF4FyGAUaAl9ddB1gdudCBDG+KfZ8VjmoUkf07fHy4ZKeO8iTaDz7foffC/eYLmtUN9/bHleKkQUNB/3lj6Sch/O9d8fdtgZ84Z1cReYWyoO05dNKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5oZQ+9c; arc=pass smtp.client-ip=209.85.160.171
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5175b6c4e19so46874681cf.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 04:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780917396; cv=none;
        d=google.com; s=arc-20240605;
        b=hkNFx704v/4K/4NKMUIOuIchA83Gh2n8dRwgetZyFrccK7caZuB0caYuid7z/cVLE0
         J2SENXXHBx/hZySptDym4pF/XeHpndmhcZmK3NsVley2Sjvcwp5kGrhhNfr9Q804t86D
         kqWQv8GHjDqKMPqpadVWRbfwMd0j93VH8RKJ40Isa0OqDaGofbsHvVLTsAp80q3sPio4
         oAWQUZFlv2u6jDLkDR47T+VPe4mEsc5PXOYzKot/4xPxUmzjJ8IbSkUNjO+iI3gKt3SY
         1mzV4Lvi0x8KR4RR6NjqAEwKpzpApbfUIAdGg7CCvM4/SvJopzByryAHx5vb8fiVJeM+
         ImUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xF8X7w2g5DmOlj4MXnYATcTrIzjqSrR6buYQGHCicdw=;
        fh=Hd3+9qjwHjSIeqy2CPDDYYuNxK8x8tQ2Luz7p1XYxqY=;
        b=ZQvx8l81S4kz5cW17qzrZBAG7sBVrmIKs/CYvbQT10hHy/qA7LnIiLwBw0riI/rZJF
         OgYCG7msIQujNqnF0diMUbG64b1yyKAcDCy9f02W0LE3wEPEBiPi3ZtH+x0/mffAF2WC
         tNIptApAHMZB8f332ttYbFtheLNLOulqVGS/c4n1R0KsTbiq2CX1i4rTHS+NWFFSqvqo
         VlriF+Ye6h+50DHhyNHIn0Dv1P1241OxUNhZflJonVzI1STVRNZRgkpLSEqVXHtr8TGt
         XbgOtoy4tC/WmccgH84/pv8hQz3itlGZu8yNTl163RTpfz6TgsiULLIAaHyjFOEgZ/I1
         AyWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780917396; x=1781522196; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xF8X7w2g5DmOlj4MXnYATcTrIzjqSrR6buYQGHCicdw=;
        b=Y5oZQ+9clwATiuyXOEHDgDN8KYvP9nUod5AUA0vTGHFQxCUcL59SSRS0InFuBXpARN
         5upl6e4Aui4xUkQoMh03dsWXbOV1xRerO71ivdzyNEDn9yHShkYETX5uITq43vRXA6Hv
         w+Nys8XtzSx4jczzbwEmnVBvv8A95uGd5Y/KwtaTP8svCt+b8KYUQdKqgllkeJ9XKylo
         7yrtBAbHNl1lgaJYYrW0wuBev/sFN2BLkxH88MShp1KZNGX1EDl6D0BzlHJOf4PwVG1R
         s6H2zFpcVTf5wDrJSthGS9LOMkBFdKy4X2VzJ5ZhIqMhBBTyKfN2mkDImr3gcHSOk+fA
         RLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917396; x=1781522196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF8X7w2g5DmOlj4MXnYATcTrIzjqSrR6buYQGHCicdw=;
        b=K+Cp5HTkaVy2T418hIo8pYwZiux0zB0txwcqeGVwNb9YpdsWI2OldKJ8ckbKIdO6VQ
         8N8lyLP5Cwqn/fvrgoUY+d+us65zSf5mRhLI8r70hlP/NkbtKqeBWSgGFqAi1iGMRqDv
         3PhcanbwyBE9/SNg49D41aUlThTjKBeFQqKWotwzbGg4Hv/NUXsQ8AZcZ6LqsdDjpq4o
         /f9cdF5bisRQfIBJZLsPUI7dtYjcoguPWheDPrpUbr4jSFTW7OkVfaUHtreSa6lGTLPx
         AxpGALWiURfyvhq+AEUm3mlVwrc5orJvWvbbPgWX4sDI+w2ZLT2vuNAkP7e9k+XIYy/P
         HliQ==
X-Forwarded-Encrypted: i=1; AFNElJ97nH/2/0oIkhxQusg02ylwwsSLSfGKah0Rezoj6wR0/vP5hf9z19FoepSRl1vL3bizdcVdVZcj6oI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJU8sYXeHQhF88Ub2dTPAohQyL6LvaWKdq75eG3IthEWbKqtx
	wRtfPl1+lnm5kcVwaBpZzuZsK04utvjPj3zgIzpo0967V7aiZhZBMzdJt2bLq7CqbrhhjIL3F3+
	1bMl1psAoPUrepvFYdzDFLLuYUVLhl2c=
X-Gm-Gg: Acq92OERtXcVBZHYWVZKjpkDUTKsHb0GgcTSloZVFa/hOZvDm1cT+uAApmkavZNufIF
	mfcqvhUxUCft0AFkczuohNumU062oIWWl8WeRHcME6Fa/Avi5paI0n+Ai9zJwVGg1vUNGo2CjLg
	EPBCSFsCoTbIe/13xZ7N68kbn9kfSdAZUuyf5fJcwwQx+xDPhyYjEg+3S1eFrS2Vq4NZXTm4WeF
	ck2BuFrMoPQQ75MaiNIMG926CA+L25PS355y0K8sFyg3laNvTXWtOF9w0FPHI9lwI6wh1PPLs+G
	Kfa33YdixvtNKGJ00MEfizTH3iOGiNwqQBlylewLJ7VuZbi7Nw==
X-Received: by 2002:a05:622a:47cf:b0:517:2c1e:8b6 with SMTP id
 d75a77b69052e-51795c66183mr196745691cf.38.1780917396089; Mon, 08 Jun 2026
 04:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604031840.17236-1-amandacorreasilvax@gmail.com> <87v7byz58v.fsf@trenco.lwn.net>
In-Reply-To: <87v7byz58v.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 8 Jun 2026 08:16:23 -0300
X-Gm-Features: AVVi8CdltgkqX1gCBWqdxwN2lrtcEUWqwXn_utUTMjDjilk8clAg9aRvWC9o2VI
Message-ID: <CAMAsx6ehOk2n7OSRbNaqu-34Je6mRMAc0dS4VXcke-ah53BtMw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, 
	linux-doc@vger.kernel.org
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:amandacorreasilvax@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91355-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 469FD655A40

Hi Amanda,

The grammar for Brazilian Portuguese is okay.

Thanks,

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

