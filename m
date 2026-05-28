Return-Path: <linux-doc+bounces-89875-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNKwFs47GGo1hggAu9opvQ
	(envelope-from <linux-doc+bounces-89875-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 14:57:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE795F25FC
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 14:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF6C93006D58
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9AC3E3DAB;
	Thu, 28 May 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNr54O51"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D573BED23
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973064; cv=pass; b=s2EQcp41WKa+4tI02oTogXQb2BkKIEPnt6bxYXGvDOSMIKcKFB6e8niisyFkZcm5iFNyEcMnZwBBNN2Kch1fHWabDSFBG6xBOyfKMhhgFFpGlBjk+l2QXliCUyuKZq0aE8fAKkvqJi1khHllq0ziVl0KF3kzqEb7cRAPyqnS3lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973064; c=relaxed/simple;
	bh=fUHwBcjHUAk86dogR30rnj9wrSq1FRhyZ1sZYAiJlak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2HCzleRPZ1bAlwYN9m23QWAdv/irqFEObJ4wEBmJ3Y9pE3ViZhSvBw7dpndCiyXY4merOvyxOH560pZKco/iAlJqdNAykEjq630FhoBn8AH86NH1sj7kAsEqYPj84LzS7wu8EuXnLOOrChAhfb/fffT+1WPCDuKT4K4jCw3olA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNr54O51; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69d8ff0ca12so3862226eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 05:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779973062; cv=none;
        d=google.com; s=arc-20240605;
        b=NZKAlGOPXvdmmE1pabdohtWuPd3jRB08pdM/OyLZXneBuVmYyZHgssapjf6Z3tNwgi
         Q07Slv27WMypbSwcsaSVuT1H0NvyDBUk2h0KwztKvtJHBPCFtk0I2CB//Bomsk+I2h8O
         MCS7CWBnGknEKprKJAVSuClwG40oEIZJPErBoEZbkG4PtxfuY5xxRAS7HHUCyfZ7rSDc
         oeTn27U2Jv6ocB10FMpTDdBwl9r4USn0RuRPQuCt91l5OSK7joSgv2GS1d2umsKP4q9h
         IklVpUtd3F3ZPpdiKDdanBHv6iFPHYlPyDIXcmphvRowoTDDtgfYYgBGKHycee+Ok6Y3
         1yRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3Zbyw8SnKug00j3JWXX32OB1/0Us79zmL6jLVv0iYg=;
        fh=ypXvQZ/ZpkXK8Ee/dpFp2aSLA4ag94SjQOPBS8tVjUc=;
        b=Q+I1tdnoeasBPj2gJhESK0x1AsJVIcOKjMpJ0RrLeBQNDD6dVhpqinQo3QcX6DKaIg
         370T73IWgn2Yc84RfXXoqtG98Z97Now2oT1V2jClL9VgxmtDTRruR+HUCJFwtOLW7Jj/
         VkwtGUVqmmFiRHLJ6dtJcXoptTBIyxLyTcR4LDedwkcf55IgzCVFh9iVBbIW3WMWXw0e
         92vQ4qYKPn7gmdTRRwkGga+ofbEVAdYXsg1D0WJp9ku+n6rQ/jBaS7357t9sHWyVeQGA
         FXhpICSP7oYqfgMVeUDt5b7iq+4jEQRMEVTq2vFHS7ctGhE+i/MOZ6IQZPOmlmWhjHNA
         9aYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779973062; x=1780577862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3Zbyw8SnKug00j3JWXX32OB1/0Us79zmL6jLVv0iYg=;
        b=ZNr54O510mqcEL2nopfro5t2GhFgjibCwysMYxPjyA5b9mxXM2oUdvJZuVTsGUPDeY
         veVuL6opBKxZ9PXU8jh5JBv+4yP87/lJjXjdqGyT5R5dpSxs0lc3qooMcGn3YWvjWWUy
         0143XHJxiemdGtQjXeNoLGnktAE7Iruv+Tu0pNiPAfNwW8R+pOEPyV8McDRgsSf+Crd6
         jc9dIRwCqG5wrSqC5lS4p00I0S4sm69fjV66uKwLV4sp6Fjx7Aac86BVXH2wZPj9N7TN
         qA3X8aUNjiLjwlDaa7Up49GvM7TvBamUOnCWGEmTaupu7hX3++5QMdUO0+ajDOf6jkV4
         JB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973062; x=1780577862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3Zbyw8SnKug00j3JWXX32OB1/0Us79zmL6jLVv0iYg=;
        b=OuLfBc645/dyYVoJUxdgjpm46A2bpUiqoCAHH+rnIzA+r6B40x0V8dScqPLsZuH49i
         zGCfl4jHj9gHBvz5yRTRpf5A2t5ZWPsUqU3V+m5CgyPccIa1P6Vz9rD6zy/oI5qKgrVL
         zK4Nqq2DZY/Zpmk8XSuNT2LM1xj18u59q4ITeazJU+GxO2wEkDaoFXysxSYPQ+DCCbn2
         o/fRrPUfcV+8n9JiW0CZsxcrxuy2/Zkzae0bDXsN4v/aYYF0n+5ta9/CNyt6P5TDCmAQ
         Hfu6o5K/QAywRsATczbCCo6wlhhlNwGr+A0qokPco/+r5Ttq63C3EGOHai7FVEWqKMf0
         82CA==
X-Gm-Message-State: AOJu0YypIDmma7x99yycreheJQQ9U1G0RKd4gCOmXNkjpcFjX8mAwrFj
	p8M7zVy6Tfl7RTyyYqS/fp+Wy6ehoS53VDY00EFWi1Tx2sDb8e/U1OBW+NQithJ39++Ol+vMglM
	1SnRj1oJZpeKG4dXZDrTWkb/tkUfLRr8=
X-Gm-Gg: Acq92OHMsxE+4CTiMoZhWZ9fIXzdcxV1WyMFIiFWnmCx9ILZ0cP8RUGX1xWpRqqqkW2
	DP5HKv3F6vBoBKkKm++y43cCG9swX0sDYKw+NDwFnPinASOSjM+KL7UDpb6INq4V0co9jZfftsD
	vluRcN0IiZxKW/cLYj1u2mWK4MhxTnnjEEMSP7nyZT4ZUJEKoetFjUhu2iYFEIjxVBlMxi1RCg2
	vRQK7iOy4VeZg5YG2YmAViHBKQvYplLMYDp3FTZ6ZRoePyQ78po9fBEOAZzNlnjOGNIhEuSVoHj
	Hgp0Lz1GBDjxbbou+okxFPVtk+VFCeRDuzKxSmOcOtN4fHGXg/lHiLEC/XYa
X-Received: by 2002:a05:6820:4d06:b0:69d:e235:8868 with SMTP id
 006d021491bc7-69de2358d98mr4252279eaf.36.1779973062035; Thu, 28 May 2026
 05:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 28 May 2026 09:57:29 -0300
X-Gm-Features: AVHnY4KKido7uxpZ0jzuysGjwd5RUIyn6WaNQZ9Y3bsKYEs1s0DoXXRj-yiVRtM
Message-ID: <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-89875-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5AE795F25FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 1:20=E2=80=AFAM Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> wrote:
>
> Update the content of the maintainer-handbooks documentation
> to Brazilian Portuguese.
>
> v2: Update maintainer-handbooks documentation based on the actual latest =
version of the English
> documentation. Prior version was based on an older version of the English=
 documentation, which caused
> some inconsistencies between the two versions.
> This update ensures that the Brazilian Portuguese documentation is in syn=
c with the latest English
> version, providing accurate and up-to-date information.
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  .../pt_BR/process/maintainer-handbooks.rst    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Hi Amanda,

I believe this is your first contribution.

I noticed that the titles for v1 and v2 of this patch were different.
When sending subsequent versions, please maintain the exact same
subject line, only updating the version tag (e.g., from [PATCH v1] to
[PATCH v2]). This helps significantly with identification.

Regarding the content, the Portuguese grammar is correct, and the
change makes sense.

Thanks,

Acked-by: Daniel Pereira

