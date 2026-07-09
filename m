Return-Path: <linux-doc+bounces-95926-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rKqLFg18T2q2hwIAu9opvQ
	(envelope-from <linux-doc+bounces-95926-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 12:46:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4172FD36
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 12:46:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=qMtUZfQW;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95926-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95926-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8520130C1CF7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 10:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959683AD535;
	Thu,  9 Jul 2026 10:28:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A8403B07
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 10:28:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592882; cv=none; b=nJ0fsYHWAsrXB/CtVTWOos3f6d9Aq1WC+hIM3WJPXwZBqQvC3jEvTkDydvhQ4wNwPH5672Q0f6oi8AQsX2dO/eFspfVSQaqLvQzYtvzxCW3vlQTEU8X+C7xCo3fN873rtZb2q0ypbVeVu5mB0wRsSqn42mBTc2Wbxg3soGtTAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592882; c=relaxed/simple;
	bh=MxLey4kR4pPKpR8Eqs6jpbSuCMQEbnoM8JXbBb9w8kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5xrRaQ/u00ggq+/StbU1Nox/UC6Xe1uMrYHQXpSpkXD2GcaU6gC4AF7PrxyMcciZsrvuxN7rIekDqjGqUtNyutmANWKKFIve8v8+VrV/daIrdedENiKndl5WEvoaMtH9rFBS2hYchQZP/XI8ao1e+WonLAORdf79+Ra+TYHcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qMtUZfQW; arc=none smtp.client-ip=91.218.175.186
X-Forwarded-Encrypted: i=1; AHgh+Rpuwipyja8JnfwW6W+PrskGUKDEmFVBFdrOMNihUC8zYPP7YyDN3+J8QoaTguPtl1jFFzogE1VuH1s=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783592879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MxLey4kR4pPKpR8Eqs6jpbSuCMQEbnoM8JXbBb9w8kA=;
	b=qMtUZfQWBJHXylSaH+WIU/LECbY1mNBLUxpYrOZmX/bh5EqZygB8qCG9NPmauuxgNtuIBb
	8F7Cz4Y0f30GUw/VmKWodmMt1iV5PrUiw1jOfvIf83M6BUmcmKLqJrtYOHOwFY9g2Y4Sve
	S/2SG/5mf0Av0DbAcpr6jjjspGBkKZ4=
X-Gm-Message-State: AOJu0YyTcwfv/F4duee9onJSxZ6QK8UD5STDTT0FkUU8UcwpC9JdaKkg
	2UfQJByVUO6HnxY/437b67DJ7kdwvmpyDKKCOxgegBOBDynl6lsCthfo3B24UgIE9Xxm6csaZCc
	lIN8eLsUjf9DrbEL7c+h4nWeLVOonpd2IGEHDKUOZ
X-Received: by 2002:a05:622a:248b:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51c9a7990e9mr6344801cf.6.1783592838569; Thu, 09 Jul 2026
 03:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 11:26:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
X-Gm-Features: AUfX_mwpyfAsKpUMf2tNxcvppePr82pc_iCQFLAefIFcUoHnYHNmsUIYIv4f_m4
Message-ID: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:maz@kernel.org,m:joey.gouly@arm.com,m:catalin.marinas@arm.com,m:suzuki.poulose@arm.com,m:will@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:oupton@kernel.org,m:Dave.Martin@arm.com,m:mark.rutland@arm.com,m:ben.horgan@arm.com,m:jpb@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:peter.maydell@linaro.org,m:eric.auger@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-95926-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FD4172FD36

Hi Mark,

[snip]

> base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37

I think this SHA is local to your tree. I can't locate it, and neither
could Sashiko [1, 2]. For a series this big and complex, it would be
good to get Sashiko to review it. Could you please fix that?

Thanks,
/fuad

[1] https://sashiko.dev/#/patchset/20260709-kvm-arm64-sme-v11-0-32799f66db9d%40kernel.org
[2] https://sashiko.dev/#/log/baseline/42725/0

> change-id: 20230301-kvm-arm64-sme-06a1246d3636
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

