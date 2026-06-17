Return-Path: <linux-doc+bounces-92648-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +yEUN5DHMmqy5QUAu9opvQ
	(envelope-from <linux-doc+bounces-92648-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 18:13:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8769B4CD
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 18:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Lc6Ae04m;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92648-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92648-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9856E32FA07F
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 15:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA29478870;
	Wed, 17 Jun 2026 15:56:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2F48A2A9
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:56:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711786; cv=pass; b=Ej7+PqlzlYCNZjXOVPzfDbcroTyp8AhP3tfbVnvValYv2ZCMNINOWOwuzp3b5gZgchPY+xdgGMRo+IbkCuAFoJKdzQ8q/k718GeVHeN0a+cepWNyj3nuf5ychfwPHeZJvEbqsHJqSlD4H829qBMvbu0OeFCz1uSYIb1J3wS5010=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711786; c=relaxed/simple;
	bh=qMp3VaXbqiIHIJuceGnAORnzCmwE8+VoIrbX01hxxUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npuXiuL+5yck1AT0Mt4yxm8VlwT2drlMng/3y1DZd5KJp8D8hM10XSmlVjXfeiYfh6iidiJTPlL460IG1y5hj0yywVdPg2y2PGpNxM3VBhVXZcelmjbrnV37wh1gSskJXMpbgvZ2CYfet3C5pO/i2UqZKuOpmYj36gxKcHX0ijQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc6Ae04m; arc=pass smtp.client-ip=209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177d1ff061so299771cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781711772; cv=none;
        d=google.com; s=arc-20240605;
        b=JQ4jRohqHaMM7iBTzRD+i1QHsvvJQ5TL/gNsDrOBQvGmZGgGfpVZ/Q8FNOL+dgVaCM
         SKu5dfeaDDZRfx7HqUTDw31oSf1rpEon5raZzBIRZN+wHzhsFrynHztNreU5EPTn2QDv
         9qPC9DmyLkcxtY+K2vB4OBHwRKCGGqpxqPo/QVNyUz/fh5co5BTM8W5u377hJn+7Gf1u
         SyUpSWCTRAagugMOE/bQsKpWOwyBD1BetCrUhqmpbeR6ls95BF9Qd3HvBuxW2fOXvs+C
         uLu8xQ2hdvwJVJv6zBefz3Pm885GVGLlh9lMBjO2VCEEe99XpKsCvZsLFWD8ZL+L3Zi5
         hmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        fh=+xAKfFKdW8LWnQJD2fF7noTijKKY3vMwMTXZeDO9rvs=;
        b=LJrN33bAzQKwzoSNxVBdheaY5Jgw6BOvEMyoi1kRmxSzLHdKPJ1vCDGWnJXTvdPEeV
         dQMXhijheP2YXmYeC11UCUG0U/g2HlMra51d7m/IOR4DfIw4MNuBzNQFYt6gJAptXZmM
         TktqlgG06ROh0AxvDF0NXn0qrFEL+n2QfohUTeEpaOGW5xTMtYKVeNBuFgdvNRDzPvnT
         txID9FCW6fo5UBMfA3M367YOIsXfkENAkN5nE46X0HLHXc3X2RHkjX1IsY/CFr1FRPon
         kxryPetnnhpysCJiIUUHjEQlsOpexzhNUh2haY6+3kATN5T7T7rN4Or5tAPuFBnwTszN
         UAhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781711772; x=1782316572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        b=Lc6Ae04mbdpYwt3za0xg/RD5uXK3n4VsElNhrUgriB865Kz1O9nSpHav/PiXLF/+x0
         RlBgNcDu9l8s9uLPh5JXg0sIzY0Cr1pnjeqptHGW8eLq0wkfeyPesK3GOEM54TBsWZ+z
         yzT9GHhNO+Ic4UQ0uIY+l9T/cj5A1KUybt7qN2ncnEffFF2a7aVAZNYHM+wmudOcA+Yy
         UCUh4SaoKR2ZNi6Qxn1+XM3+kKR/fSDWfrXYEwOmdf/hk/nfXaZejTBbxEw9chtZcQP9
         picgbZE5r51bmPikzCclkbLw5us2r4a9ZoBTZoAOlt8Zg7IGKtwnwHYymwoUdfDdmNgs
         xf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711772; x=1782316572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        b=Zrj+mP6NDs9rb2AEUvjo+fzw7kXvbA7P8x7WGJBnjs2RV4caW7pWKowgO1skI6HW48
         5FZ1IrWrVsr+llLtGRG1BSPAL+xufNnE+sS4pHR5/BYlC1lXySjLskyMsX8Y0R1JXPre
         4D8jNSekjGNa0KkENkagI6iI56emATEiKOkWjaODmjLNYneuiaeB5wDXcSW9mU4nDpIy
         zZoeaX0uRhMJCJDYiI21kivUfWmC1FUcdsMNStJ2nKHpkyC+Zr5DvDc4VXb79ZYcEZgj
         3Gtfu3vRP29wckZIYJXrGyr6UqjQx1a3qkzAB+reP/ooHqnE2/0Uhtoi16IGrP31tmNB
         rXZQ==
X-Forwarded-Encrypted: i=1; AFNElJ93UgtCDyAvgN856NaEUEP5Qj7hnxWKtZTFG3EfWruli9DHXKFDRlExc3aKec/5euhh0gvZIAyM428=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTv0l+bcbDHG1O3cs+NdxgIyPHNKwOa8HcmVMuJTkkYwV+nae
	n5rELaz+KUfP6cHaie6XnJHTMyonjcynm05uoIrQTJ483WVRhhwbZNjCrBnIyzjgrwPzVuYcxdg
	nucd1w3xeyb2c5Xri91qjOcQ25UKI931foHg2vgFLGI1jq8IEw8JCzkDi00c=
X-Gm-Gg: Acq92OH4lOg5JlIZBHOkUUKdHPTPW8W9k6ib5ArjQP7CEaxWoUzMVB52hOEna8s0cqq
	sJF0WUmi8QsFIznVRNwVQLgnOfm2QbzsRaBrj3At0uRp07r4sniz5KHCNvaDZ0WEqd56hhMCGXX
	Paw4muI8iaCDqB4SGE5rgBeSzLv6McH0Rmusxbf45AgSx9fSEk9OuxNeSzEqRPiXkPwDN+jwiaM
	PHO6UUNwRrxcTQgmTWsNKPqdKNA5SZ9VSA5efho11cSBs4YTEl7Vet4fwwdI8THVXjRIRl0G4Gh
	EOJLsfVR1MU+FcGLx5kAyJweIrI=
X-Received: by 2002:a05:622a:4a06:b0:50e:595d:164 with SMTP id
 d75a77b69052e-519aa968720mr11073771cf.8.1781711760128; Wed, 17 Jun 2026
 08:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com> <2f9c58f6fd8a81325ec03e19327e03b0b7dca2aa.1781564384.git.abhishekbapat@google.com>
In-Reply-To: <2f9c58f6fd8a81325ec03e19327e03b0b7dca2aa.1781564384.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 08:55:48 -0700
X-Gm-Features: AVVi8Ccnnkvljr8vqsuHECttm3M8Or1Z6AydADGkWkp28nE9QeppOD0jXeg8YMQ
Message-ID: <CAJuCfpERhK341cxCqoLXEkkUBhP7fQ56U14gDms9rwbkWK1mTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
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
	TAGGED_FROM(0.00)[bounces-92648-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39E8769B4CD

On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Extend the capability of the IOCTL mechanism to filter allocations based
> on tag's module name, function name, file name and line number.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> Acked-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/uapi/linux/alloc_tag.h | 26 ++++++++++++-
>  lib/alloc_tag.c                | 68 ++++++++++++++++++++++++++++++++--
>  2 files changed, 89 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index 0928e1a48d49..3b11877955b9 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -40,8 +40,32 @@ struct allocinfo_tag_data {
>         struct allocinfo_counter counter;
>  };
>
> +enum {
> +       ALLOCINFO_FILTER_MODNAME,
> +       ALLOCINFO_FILTER_FUNCTION,
> +       ALLOCINFO_FILTER_FILENAME,
> +       ALLOCINFO_FILTER_LINENO,
> +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> +};
> +
> +#define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_MO=
DNAME)
> +#define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTER_FU=
NCTION)
> +#define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTER_FI=
LENAME)
> +#define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTER_LI=
NENO)
> +
> +#define ALLOCINFO_FILTER_MASKS \
> +       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> +
> +struct allocinfo_filter {
> +       __u64 mask; /* bitmask of the filter fields used */
> +       struct allocinfo_tag fields;
> +};
> +
>  struct allocinfo_get_at {
> -       __u64 pos;      /* input */
> +       /* inputs */
> +       __u64 pos;
> +       struct allocinfo_filter filter;
> +       /* output */
>         struct allocinfo_tag_data data;
>  };
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 82e3b5f32dff..5feb61d9fb92 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -49,6 +49,7 @@ struct allocinfo_private {
>         struct codetag_iterator iter;
>         struct codetag_iterator reported_iter;
>         bool print_header;
> +       struct allocinfo_filter filter;
>         /* ioctl uses a separate iterator not to interfere with reads */
>         struct codetag_iterator ioctl_iter;
>         bool positioned; /* seq_open_private() sets to 0 */
> @@ -188,6 +189,12 @@ static void allocinfo_copy_str(char *dest, const cha=
r *src)
>         strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
>  }
>
> +/* Compare two strings and only consider the trimmed suffix if s1 is too=
 long */
> +static int allocinfo_cmp_str(const char *str, const char *template)
> +{
> +       return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> +}
> +
>  /*
>   * Populates the UAPI allocinfo_tag_data structure with active runtime
>   * profiling counters extracted from the given kernel codetag.
> @@ -227,6 +234,40 @@ static int allocinfo_ioctl_get_content_id(struct seq=
_file *m, void __user *arg)
>         return 0;
>  }
>
> +/*
> + * Verifies whether a given codetag satisfies the active filtering crite=
ria by
> + * matching its characteristics against the specified filter.
> + */
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *=
filter)
> +{
> +       if (!filter || !filter->mask)
> +               return true;
> +
> +       if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
> +               /* user wants to filter by modname but ct->modname is NUL=
L */
> +               if (!ct->modname) {
> +                       /* validate if user was attempting to filter for =
built-in allocations */
> +                       if (filter->fields.modname[0] !=3D '\0')
> +                               return false;
> +               } else if (allocinfo_cmp_str(ct->modname, filter->fields.=
modname))
> +                       return false;
> +       }
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> +           ct->function && allocinfo_cmp_str(ct->function, filter->field=
s.function))
> +               return false;
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> +           ct->filename && allocinfo_cmp_str(ct->filename, filter->field=
s.filename))
> +               return false;
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
> +           ct->lineno !=3D filter->fields.lineno)
> +               return false;
> +
> +       return true;
> +}
> +
>  /*
>   * Seeks the ioctl iterator to the specified 0-indexed tag position, rea=
ds its
>   * profiling data and returns it to userspace.
> @@ -235,29 +276,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
>  {
>         struct allocinfo_private *priv;
>         struct codetag *ct;
> -       __u64 pos;
>         struct allocinfo_get_at params =3D {0};
> +       __u64 skip_count;
>
>         if (copy_from_user(&params, arg, sizeof(params)))
>                 return -EFAULT;
>
> +       if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> +               return -EINVAL;
> +
>         priv =3D m->private;
> -       pos =3D params.pos;
>
>         mutex_lock(&priv->ioctl_lock);
>         codetag_lock_module_list(alloc_tag_cttype);
>
> -       if (pos >=3D codetag_get_count(alloc_tag_cttype)) {
> +       if (params.pos >=3D codetag_get_count(alloc_tag_cttype)) {
>                 codetag_unlock_module_list(alloc_tag_cttype);
>                 mutex_unlock(&priv->ioctl_lock);
>                 return -ENOENT;
>         }
>
> +       skip_count =3D params.pos;
> +
> +       if (params.filter.mask)
> +               priv->filter =3D params.filter;
> +       else
> +               priv->filter.mask =3D 0;
> +
>         /* Find the codetag */
>         priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
> -       while (ct && pos--)
> +
> +       while (ct) {
> +               if (matches_filter(ct, &priv->filter)) {
> +                       if (skip_count =3D=3D 0)
> +                               break;
> +                       skip_count--;
> +               }
>                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> +       }
> +
>         if (ct) {
>                 allocinfo_to_params(ct, &params.data);
>                 priv->positioned =3D true;
> @@ -298,6 +356,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *=
m, void __user *arg)
>         }
>
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
> +       while (ct && !matches_filter(ct, &priv->filter))
> +               ct =3D codetag_next_ct(&priv->ioctl_iter);
>         if (ct)
>                 allocinfo_to_params(ct, &params);
>
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

