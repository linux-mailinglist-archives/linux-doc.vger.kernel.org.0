Return-Path: <linux-doc+bounces-1242-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4F7D8A7A
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 23:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D2428210D
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 21:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C5E3D980;
	Thu, 26 Oct 2023 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="O55ntrRk"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBB11C9E
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 21:37:14 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A24F129
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 14:37:11 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a7af52ee31so10875897b3.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698356230; x=1698961030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXajQCd4F/1lAfqXs9yFErTqS9iveL7bqi06E72Hzxw=;
        b=O55ntrRkoSk4p1rxbJKdJBiHXyyTLjqfDZlFDCFTDaAftVT9vSSpsZ5Nn/lBMXAMyA
         ngDsmGBQp16yWWUcSgjhE62qWfR/TPOOju5Wg6mZIWwtVZ0K8IBssUBxJ0uZ5Uqnrg52
         TKGh5rInzQ0tNfMj7BSwHDqlljEjhadQoqWTGhbl7JaXlDBCzYGjy2L3kHy9P30XCuLX
         S9MBoeODeT+oeMN2t/4TkRRXms1vrjYWN82xnLFav2POjw6xrL9KOI9y5VnAXIapfMsq
         RtHKYkm/eYoYhmJW3S40jagam0J1jq/aK7JEDwETISARtuHZHYJxPSwVFCiuI1KA5Le+
         x4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698356230; x=1698961030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXajQCd4F/1lAfqXs9yFErTqS9iveL7bqi06E72Hzxw=;
        b=JIOyX+4/gkAf2P8a5NF0D8aNrLgiyyuQGYAlRILOep9n1aqRb89aEYTbHWqUrdVigc
         HEhWVgA5RDfbgjgdLXIC8Z0djmsHDSfXoW7Dw5Df/zT65gAdcGhcXj8Iz2MdLfO8Wlwb
         j+2sT+MJReVAh8A++fDbgGucU70A3oZTSUrh+S5iu/B9/iNQSRa5vbOBRbkKgQTrOBn1
         TVkIDodAWDO+ESQFppvFffQ2TWOA4i3Aro4dhkLNwni9oK+iLGV62nQ18vhadvIu56lI
         CNKqNLnaV5rNWmvK0/wdGK9WkJ6uUQV0Lco//l057X9lqMQWNQ81YyVpX/lka0nZZ/RI
         7kyw==
X-Gm-Message-State: AOJu0YxNQU3Wi0xYFBEZARQz7J3tBgzeL8h741eyjmVUL9F8hWMglZ77
	qKvBC9rvsPSVd4p621IpXVFyKvfJ2NsO9QjaCrD3
X-Google-Smtp-Source: AGHT+IGs3yVweOLen1m7MhCJB6RbgNFPe23s8osYedKaob9va7EUB7gQ3SlX41xgxocwXKE4pusvmi6cSAkHebq1bDk=
X-Received: by 2002:a25:238e:0:b0:da1:2a2b:4c5b with SMTP id
 j136-20020a25238e000000b00da12a2b4c5bmr342821ybj.41.1698356230039; Thu, 26
 Oct 2023 14:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1696457386-3010-3-git-send-email-wufan@linux.microsoft.com>
 <7c8c2a158c628a642078f746e5c42f2f.paul@paul-moore.com> <594923f6-6942-4b4b-8ca1-b9dcf74c9c1c@linux.microsoft.com>
In-Reply-To: <594923f6-6942-4b4b-8ca1-b9dcf74c9c1c@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Oct 2023 17:36:59 -0400
Message-ID: <CAHC9VhQv5xBtG9zVk_rpNmQ=GLm9sitxeyqbwkw=LmHAN0Su3g@mail.gmail.com>
Subject: Re: [PATCH RFC v11 2/19] ipe: add policy parser
To: Fan Wu <wufan@linux.microsoft.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, 
	tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, 
	snitzer@kernel.org, eparis@redhat.com, linux-doc@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, 
	dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, 
	linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 6:46=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On 10/23/2023 8:52 PM, Paul Moore wrote:
> > On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> >>
> >> IPE's interpretation of the what the user trusts is accomplished throu=
gh
> >> its policy. IPE's design is to not provide support for a single trust
> >> provider, but to support multiple providers to enable the end-user to
> >> choose the best one to seek their needs.
> >>
> >> This requires the policy to be rather flexible and modular so that
> >> integrity providers, like fs-verity, dm-verity, dm-integrity, or
> >> some other system, can plug into the policy with minimal code changes.
> >>
> >> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> >> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ...
> >> ---
> >>   security/ipe/Makefile        |   2 +
> >>   security/ipe/policy.c        | 101 ++++++++
> >>   security/ipe/policy.h        |  83 ++++++
> >>   security/ipe/policy_parser.c | 487 +++++++++++++++++++++++++++++++++=
++
> >>   security/ipe/policy_parser.h |  11 +
> >>   5 files changed, 684 insertions(+)
> >>   create mode 100644 security/ipe/policy.c
> >>   create mode 100644 security/ipe/policy.h
> >>   create mode 100644 security/ipe/policy_parser.c
> >>   create mode 100644 security/ipe/policy_parser.h
> >
> > ...
> >
> >> diff --git a/security/ipe/policy.c b/security/ipe/policy.c
> >> new file mode 100644
> >> index 000000000000..3a529c7950a1
> >> --- /dev/null
> >> +++ b/security/ipe/policy.c
> >> @@ -0,0 +1,101 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) Microsoft Corporation. All rights reserved.
> >> + */
> >
> > ...
> >
> >> +static int set_pkcs7_data(void *ctx, const void *data, size_t len,
> >> +                      size_t asn1hdrlen)
> >> +{
> >> +    struct ipe_policy *p =3D ctx;
> >> +
> >> +    p->text =3D (const char *)data;
> >> +    p->textlen =3D len;
> >> +
> >> +    return 0;
> >> +}
> >
> > The @asn1hdrlen parameter isn't used in this function, at least at this
> > point in the patchset, so you really should remove it.  If it is needed
> > later in the patchset you can always update the function.
>
> Although the @asn1hdrlen is not used, it's a required parameter for the
> pkcs7 callback. I guess adding a __always_unused might be the right
> solution?

Ah gotcha, I'm sorry for the noise, I obviously didn't catch that.  As
for the __always_unused marking, yes, that's probably a good idea.

> >> +/**
> >> + * parse_rule - parse a policy rule line.
> >> + * @line: Supplies rule line to be parsed.
> >> + * @p: Supplies the partial parsed policy.
> >> + *
> >> + * Return:
> >> + * * !IS_ERR        - OK
> >> + * * -ENOMEM        - Out of memory
> >> + * * -EBADMSG       - Policy syntax error
> >> + */
> >> +static int parse_rule(char *line, struct ipe_parsed_policy *p)
> >> +{
> >> +    int rc =3D 0;
> >> +    bool first_token =3D true, is_default_rule =3D false;
> >> +    bool op_parsed =3D false;
> >> +    enum ipe_op_type op =3D IPE_OP_INVALID;
> >> +    enum ipe_action_type action =3D IPE_ACTION_INVALID;
> >> +    struct ipe_rule *r =3D NULL;
> >> +    char *t;
> >> +
> >> +    r =3D kzalloc(sizeof(*r), GFP_KERNEL);
> >> +    if (!r)
> >> +            return -ENOMEM;
> >> +
> >> +    INIT_LIST_HEAD(&r->next);
> >> +    INIT_LIST_HEAD(&r->props);
> >> +
> >> +    while (t =3D strsep(&line, IPE_POLICY_DELIM), line) {
> >> +            if (*t =3D=3D '\0')
> >> +                    continue;
> >> +            if (first_token && token_default(t)) {
> >> +                    is_default_rule =3D true;
> >> +            } else {
> >> +                    if (!op_parsed) {
> >> +                            op =3D parse_operation(t);
> >> +                            if (op =3D=3D IPE_OP_INVALID)
> >> +                                    rc =3D -EBADMSG;
> >> +                            else
> >> +                                    op_parsed =3D true;
> >> +                    } else {
> >> +                            rc =3D parse_property(t, r);
> >> +                    }
> >> +            }
> >> +
> >> +            if (rc)
> >> +                    goto err;
> >> +            first_token =3D false;
> >> +    }
> >> +
> >> +    action =3D parse_action(t);
> >> +    if (action =3D=3D IPE_ACTION_INVALID) {
> >> +            rc =3D -EBADMSG;
> >> +            goto err;
> >> +    }
> >> +
> >> +    if (is_default_rule) {
> >> +            if (!list_empty(&r->props)) {
> >> +                    rc =3D -EBADMSG;
> >> +            } else if (op =3D=3D IPE_OP_INVALID) {
> >> +                    if (p->global_default_action !=3D IPE_ACTION_INVA=
LID)
> >> +                            rc =3D -EBADMSG;
> >> +                    else
> >> +                            p->global_default_action =3D action;
> >> +            } else {
> >> +                    if (p->rules[op].default_action !=3D IPE_ACTION_I=
NVALID)
> >> +                            rc =3D -EBADMSG;
> >> +                    else
> >> +                            p->rules[op].default_action =3D action;
> >> +            }
> >> +    } else if (op !=3D IPE_OP_INVALID && action !=3D IPE_ACTION_INVAL=
ID) {
> >> +            r->op =3D op;
> >> +            r->action =3D action;
> >> +    } else {
> >> +            rc =3D -EBADMSG;
> >> +    }
> >
> > I might be missing something important in the policy syntac, but could
> > this function, and perhaps the ipe_parsed_policy struct, be simplified
> > if the default action was an explicit rule?
> >
> >   "op=3DDEFAULT action=3DALLOW"
>
> The complexity here arises from our need for two types of default rules:
> one for global settings and another for operation-specific settings.
>
> To illustrate the flexibility of operation-specific default rules, users
> can set their policy to have a default rule of 'DENY' for execution,
> meaning all execution actions are prohibited by default. This let users
> to create an allow-list for execution. At the same time, the default
> rule for read can be set to 'ALLOW'.  This let users to create an
> deny-list for read.
>
> Adding explicit default rules can simplify ipe_parsed_policy struct, but
> that impose a burden on users that requires users always add the default
> rules the end of the policy. In contrast, our current design allows
> users to place the default rule anywhere in the policy. In practice, we
> often position the default rule at the beginning of the policy, which
> makes it more convenient for users to add new rules.

Okay, thanks for the explanation.

> >> +/**
> >> + * free_parsed_policy - free a parsed policy structure.
> >> + * @p: Supplies the parsed policy.
> >> + */
> >> +void free_parsed_policy(struct ipe_parsed_policy *p)
> >> +{
> >> +    size_t i =3D 0;
> >> +    struct ipe_rule *pp, *t;
> >> +
> >> +    if (IS_ERR_OR_NULL(p))
> >> +            return;
> >> +
> >> +    for (i =3D 0; i < ARRAY_SIZE(p->rules); ++i)
> >> +            list_for_each_entry_safe(pp, t, &p->rules[i].rules, next)=
 {
> >> +                    list_del(&pp->next);
> >> +                    free_rule(pp);
> >> +            }
> >> +
> >> +    kfree(p->name);
> >> +    kfree(p);
> >> +}
> >> +
> >> +/**
> >> + * validate_policy - validate a parsed policy.
> >> + * @p: Supplies the fully parsed policy.
> >> + *
> >> + * Given a policy structure that was just parsed, validate that all
> >> + * necessary fields are present, initialized correctly.
> >> + *
> >> + * A parsed policy can be in an invalid state for use (a default was
> >> + * undefined) by just parsing the policy.
> >> + *
> >> + * Return:
> >> + * * 0              - OK
> >> + * * -EBADMSG       - Policy is invalid
> >> + */
> >> +static int validate_policy(const struct ipe_parsed_policy *p)
> >> +{
> >> +    size_t i =3D 0;
> >> +
> >> +    if (p->global_default_action !=3D IPE_ACTION_INVALID)
> >> +            return 0;
> >
> > Should the if conditional above be "=3D=3D" and not "!=3D"?
>
> >No, "!=3D" is the correct one.
>
> The purpose of validation is to ensure that we have enough default rules
> to cover all cases. If the global default action not invalid, it means
> we have a global default rule in the policy to cover all cases, thus we
> simply return 0.
>
> However, if there is no global default rule, then we need to ensure that
> for each operation, there is a operation specific default rule, this is
> validated in the for loop below.

Makes sense, thanks.

--=20
paul-moore.com

