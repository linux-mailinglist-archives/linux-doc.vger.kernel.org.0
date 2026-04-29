Return-Path: <linux-doc+bounces-85230-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDDGFb+F8mkDsQEAu9opvQ
	(envelope-from <linux-doc+bounces-85230-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 00:27:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8B49AF3A
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 00:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 511C4300A594
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 22:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB1939C65E;
	Wed, 29 Apr 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOivjC+R"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986D349B0D
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501623; cv=none; b=ecBJ59tJQIWMhuUaJq0QuEpG/TUmPu2U2NOwLj9phbNoxDxc8vEVRH8OPwLCSWvoJCsqSRyjoIDYx9cbIlLLGmKUm9dkA5eNgxCDBZvQ3beq75sZ4YcqcS3MBaVBiOyQwIGIOtG+fAg74eh779CNuT+qRynfqILWA2z8dDtkvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501623; c=relaxed/simple;
	bh=7FLLuNiWW2NwTFYkSS2VB5lf5N9zJseWiy+ROo0ySpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOmSjCoqyTmQHLxrcJWwsAy9rt2FBJlmLq+2bNqIrdoX2eY5X9VD/TUsy0tu8ZTIwdv43MPErWMP3GnF9rtzhBwU2uXX+u9BUrMBrxc+Bm11ONhfK4O22u8WybPoRxq2dtRo5CTizXTTzb2PIGgVEL/AcfYj1lBwNUnkStNx9BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOivjC+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1ACC2BCF4
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 22:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777501623;
	bh=7FLLuNiWW2NwTFYkSS2VB5lf5N9zJseWiy+ROo0ySpU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oOivjC+RwP0V6ke89lBZ3ALGXss2S6XGVTYm5LLl1KDvA5TWWb5TtPNT3ybypeKsC
	 7kOAYq1OQVRMmXidf9qK1ur2lGDFMDVHfFyGo3cR7Gf6UVzFbhrbDCOrpcX0lQ+JIi
	 zUlLJcyF+rQ1/ZAgrNBnE0hcrUKrLlA5y77ORzUaxvkkgnGmMroWbTx2rHnDsYR9NI
	 DIWxO5JXg48/5ejjfsWcaXJ0xFrXZ0PmotUdqp9XVRe12f8RAz0HZNlP3Taa9AjoDh
	 CyAaDk2jQbEsws5AO6G0AHR9sHIV4W7QAak76ecM69uckLfPbxYk8Rj3VFfwPrlPCx
	 i1mTyLpTXOsTQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so291782a12.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+8qEyB8wbOpevr7AEhAb/2gKCKHiIhNIFBysgPdTi2bKgB55pXvxfIUgxtgqe6bBUpgWCBwcZwag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTXw4lXtKhFL0GtzTuXenkOBCJkotOPbLgl4CuJhUlDRogUv9
	Tq94AmfFQAg2vhSpaia8QpjFLZhRVO1e08LKArGPRiP5tMusSQf9x+mtkRNdurUTXYeFUImAnP9
	sp+akJT7P7H3p59t/pLHuxiGSYvIS0+s=
X-Received: by 2002:a05:6402:21cb:b0:674:c412:6f8a with SMTP id
 4fb4d7f45d1cf-67b5d97d30cmr56078a12.26.1777501622155; Wed, 29 Apr 2026
 15:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428160020.226512-1-henrique.carvalho@suse.com>
In-Reply-To: <20260428160020.226512-1-henrique.carvalho@suse.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 30 Apr 2026 07:26:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9QWJFB8oPGZaDjWhEPYJXiDRmiKZgVUwmKKUjeQPDiFw@mail.gmail.com>
X-Gm-Features: AVHnY4K8WK4czdigv9g2niX9zZPkM8IDO740j4wwVHNNGNm6Sum_nBKSmA8ZRw0
Message-ID: <CAKYAXd9QWJFB8oPGZaDjWhEPYJXiDRmiKZgVUwmKKUjeQPDiFw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] docs: smb: document SMB3 over QUIC setup for
 cifs.ko and ksmbd.ko
To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org, 
	sfrench@samba.org, metze@samba.org, ematsumiya@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 56E8B49AF3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85230-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkinjeon@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 1:00=E2=80=AFAM Henrique Carvalho
<henrique.carvalho@suse.com> wrote:
>
> Add quic.rst covering setup for SMB over QUIC between the kernel SMB
> server (ksmbd.ko) and client (cifs.ko).
>
> Update index.rst to include quic.rst in the SMB documentation tree.
>
> Update ksmbd.rst feature table: SMB3.1.1 over QUIC is now Experimental
> (previously listed as Planned for future).
>
> Signed-off-by: Henrique Carvalho <henrique.carvalho@suse.com>
Can you add to this document how to test with Windows clients?
Thanks.

