Return-Path: <linux-doc+bounces-92652-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qfQYGGDOMmrM5gUAu9opvQ
	(envelope-from <linux-doc+bounces-92652-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 18:42:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B243569B72E
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 18:42:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=NxF6BKY2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92652-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92652-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85035327F4DB
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF324A13A7;
	Wed, 17 Jun 2026 16:31:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63900481FBA
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 16:31:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713881; cv=pass; b=kTG0sNgofQKTYXvX11gnVVM5z/3IahY3f1RbODuxdMeP8hHc0E2ryh0mftXLa2A5909YpMLsRcgxGSNC4qQymUvWaQZhfc2+7f7+iN44IVc4dRLSuiI8EzenLNWP7nKvzNeYGN9HXbWKPSzbi+36z3tt2BU1bFsHBM/4nYWL0lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713881; c=relaxed/simple;
	bh=mKruHTqEV+ydvhpuWmwl3ktbQApWlky5sYSGbeGJnms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tObcMY703Nflg1U/3Omfr/1L0lKpWWpSkW0veW0YqMc450aUz8lP/DGthPRvlxUyK/QoUhkpSSApxvHTxrpObH8zwcqtrmrVrAXQCq2YjnE0CnbXycO7dCEdn6q4FxobJdh+MTdwUbD5Mc38OBXMuJWFzeP/brtgNasRetZycA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NxF6BKY2; arc=pass smtp.client-ip=209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51765331535so312101cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 09:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781713873; cv=none;
        d=google.com; s=arc-20240605;
        b=kaU/qL7jvQ3rotoLMqFIUH6ND0Py/X9g5g9YFWBxHnSqEhBmGn7ITH5qiSVE/LQCxn
         OCP6+8fBTEsVxovR7KK1HgvQ43wjYhlFdl31isiENd0NSo6RJHopBCTWxQ9JUTam5xU0
         lYocf2d/rd2w9sEvCEpSH4k7yMSbryq04kTQZhM2mbxo8vxSpcBrbG5Cet2katY5nD/A
         lKBqMxrjdGKt999DYUnKrKCAeFatmm6Jm72Ch79PiPQk4GLGE2PYkuOKeFtPFOq086yV
         S6k4XC7B4N/uC5pS5d24Cq9IZ/ALEl4VumQneHqMVYk7yB6RQiks4WZUfSXIrfwnFRmD
         zFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwqItWx2zhoOu+jNLo6XBphjqE31Cnx/skDcn/83dd4=;
        fh=I4HkoyOilSoqRj5jj/w3MWNPCvC6DsB7R/ej5tgjqFY=;
        b=XEg485sAJWpt/rE1ckgBPO1vQKecGsE3YFcS4e6bPkM2ZOt1IbbZBZHXLLpDTry64X
         0tXz2Jn9bVZ4l6Og7eWT2GKtx1tu0QxYMDsSfCIM7wyzKidh08iaviBrkdiB+9svMFco
         cq6eJtAdjsb/YFrJzXJuSYSQFKvniO6DbR7WlbxUYMfSW/IpZ/txToXrw39e9VhP7kL6
         bsTdXUSnBmcNA5Y/5ZNWf6PS4iMm9kqLnq0tyPFEvo3yNkVuJKTGGVxda6qShq6NZP4O
         FvbI9fnBo5KHvwuUtSaFIDkJ+eqbfV/s5NXfHFnxUxtfOGvV5XfIuveROGtpuH1BVGKC
         uDWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781713873; x=1782318673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwqItWx2zhoOu+jNLo6XBphjqE31Cnx/skDcn/83dd4=;
        b=NxF6BKY2Wz94crVyeWfHCYPn/UJakIF5jRNamzrScEaUgiRSOyxy27yvfLQU6YEmhR
         AjD6ENSuIruIxQyRJt7Q4DJgfTygOIThQ/OlJJgdCKeDOss6xNEQjEazsYABsvSF95ZL
         8gr+YpJij3GcfEDVso6lv7YtWx7qbo+tgjrf+zlsEQpmEkBor+NPz96qdCq2MB2dhYmT
         MB3GyIxXC9HVWCn4Unio0xngPbKmIrDLPCOD3PH1HfbizaPFJLoDxS7fiD0fxwdOtVtp
         Bt47eHiNhJOBh0YiR2RppZOLunlc7mGvWitZcsHaQZMly6B1SC3XBtnQcgkbv0q0exkg
         a/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713873; x=1782318673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwqItWx2zhoOu+jNLo6XBphjqE31Cnx/skDcn/83dd4=;
        b=jypG7nSXJtfQP5Ox3TRr46cZtZtMbe5FzLfJ2mUuNGSbQNiPhZi9CT/CUBeM4dNS5e
         3lfT0mLG7MjNwtFL5CzpCqNSATBODugXMZLeBg3xDnqgtxaUiXO7h2bo+PVgHT5my0aE
         L4rZNBQoaiZnxDkRJKaIzql7tQQaOGp/1gcFPN1Unn7Vxa5Kjkz7ThassecNoz72X9V6
         btwACRWs6X6CKhQ89PcTWKVChcUEH5SiNh4uA9LwBaUkU368IMPnchKhrVESpDZZa4y9
         QE53iVLKwJRl2tDW9lB02OhEMAQzxU/3q+1nbiJRsiDCnAENRyeYr+AnWsW4KoPKa8Xw
         ytQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TOyI8rZq3m5uHL4MvzWLmqOumkpXICNsScKelCj3BwgDSpcHVx+FoUHiZI+QKzzy3kMErZMwiBhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxchbNOVMCv+aJu3AR2HDNHpAaAYTIglGjP0sKGBeWRDdn0zgJJ
	KdH9BuKlTijilqM6Nl5qypqM9Xb+BH59nePyx8k7Be0/6RMWV673cksFi7lzBTKTE9NnOu0Nyg2
	ew6gblKO7tjsFShhONX8ZN9/cU18nrrujmBwpQufq
X-Gm-Gg: Acq92OHeUM33Vz4n/SFGAjgoQG+JoufSgVTVFliyDQJzK6pP2pMixDVCtvN2fc90BTD
	qre39fADOQ6Tw3UfbFzBLEK+IVnYNUDRGivJLBTljtYRt0fF5RqPV8zJD3LuDoRgAzGhsZOKWxj
	1F3kpn8zpBXEXkGkyuWQEJ04HjHSIKt0LekwbVMkHNsk1CZWN0kf9blGbNLnlIQ+AzR82FIaqKD
	g3J09A+NSyUV61hJPG9Lx8Gak2iKq610qDo0SlvFnhq7i62lS20P/OJcvzV/fKtM779DHhQwZQ1
	qqB9NJkE2WbFmAPpHCOAaRrziANdaRaRq3/yJg==
X-Received: by 2002:a05:622a:c17:b0:517:99ea:ab80 with SMTP id
 d75a77b69052e-519aae433f3mr10984371cf.26.1781713872147; Wed, 17 Jun 2026
 09:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com> <db41f6b4a1ec7429be79b3b342f1ac8cf1300e72.1781564384.git.abhishekbapat@google.com>
In-Reply-To: <db41f6b4a1ec7429be79b3b342f1ac8cf1300e72.1781564384.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 09:31:01 -0700
X-Gm-Features: AVVi8CcdfMAr-2IUGIwuq0ed5D66f5ARjmPrvoZSjdivlnH_oGVPzXV2FjX90bE
Message-ID: <CAJuCfpHvDhdVseywuk08iJKhos_rU0bsaoKKRPayQ0Oo1OJamA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92652-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[surenb@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,m:hao.ge@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B243569B72E

On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their accuracy.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> Acked-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/uapi/linux/alloc_tag.h | 4 ++++
>  lib/alloc_tag.c                | 8 ++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index 7f5acbb44c14..6ea39c4869fe 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -26,6 +26,8 @@ struct allocinfo_tag {
>         char function[ALLOCINFO_STR_SIZE];
>         char filename[ALLOCINFO_STR_SIZE];
>         __u64 lineno;
> +       /* filter criteria only; see allocinfo_counter.accurate for actua=
l accuracy */
> +       __u64 inaccurate;
>  };
>
>  /* The alignment ensures 32-bit compatible interfaces are not broken */
> @@ -45,6 +47,7 @@ enum {
>         ALLOCINFO_FILTER_FUNCTION,
>         ALLOCINFO_FILTER_FILENAME,
>         ALLOCINFO_FILTER_LINENO,
> +       ALLOCINFO_FILTER_INACCURATE,
>         ALLOCINFO_FILTER_MIN_SIZE,
>         ALLOCINFO_FILTER_MAX_SIZE,
>         __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> @@ -54,6 +57,7 @@ enum {
>  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTER_FU=
NCTION)
>  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTER_FI=
LENAME)
>  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTER_LI=
NENO)
> +#define ALLOCINFO_FILTER_MASK_INACCURATE       (1 << ALLOCINFO_FILTER_IN=
ACCURATE)
>  #define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTER_MI=
N_SIZE)
>  #define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTER_MA=
X_SIZE)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index b3d21834b61e..4fb3653cb876 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -253,6 +253,8 @@ static bool matches_filter(struct codetag *ct, struct=
 allocinfo_filter *filter,
>                            struct alloc_tag_counters *counters,
>                            bool *fetched_counters)
>  {
> +       bool inaccurate;
> +
>         if (!filter || !filter->mask)
>                 return true;
>
> @@ -278,6 +280,12 @@ static bool matches_filter(struct codetag *ct, struc=
t allocinfo_filter *filter,
>             ct->lineno !=3D filter->fields.lineno)
>                 return false;
>
> +       if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> +               inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> +               if (inaccurate !=3D !!(filter->fields.inaccurate))
> +                       return false;
> +       }
> +
>         if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FI=
LTER_MASK_MAX_SIZE)) {
>                 if (!*fetched_counters) {
>                         *counters =3D allocinfo_prefetch_counters(ct);
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

