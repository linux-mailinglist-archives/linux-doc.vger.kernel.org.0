Return-Path: <linux-doc+bounces-92644-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oA3xJvG/MmpY5AUAu9opvQ
	(envelope-from <linux-doc+bounces-92644-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 17:40:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9469B14D
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 17:40:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=lAtriQHn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92644-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-92644-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BAC5303CD7F
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E60492181;
	Wed, 17 Jun 2026 15:39:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6E47F2C4
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:39:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710785; cv=pass; b=fjArzATtfpDfeyLez7+Lc3RLpSB6t2JAGblJPlz1fyRk8U97M2bN0rN6HYB0C8l0XCT1ZNA3h+3Tt28j9DOy1e4OQgj747U3Mn03sqLUW/PGRu27J0+Pu0bsIDgHCAQZdD5J0npWe/wDfXBSDM0Q2LfNq9nioCUp1wBytCHnDCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710785; c=relaxed/simple;
	bh=TVNwA39PuL7lZTm4ROm6uBXJ1RtMUXuHwyXQbJtrJws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+kD+j1aMzJuYz7a1A2BVOwHihnrqFujTZRAAgqC7a5ZKiUBnECgsar47jCnMYCL6oXO1oSfC7jt8YyBYIG606iWBVJKGjjC/rySvlWCYHKcV/oA6o+xAPVxoIIpGUbrqqiR23xYEhXNnSlDw8t6wErejEmV0nYVpqEy/m3Liow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lAtriQHn; arc=pass smtp.client-ip=209.85.160.169
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51765531803so332651cf.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781710767; cv=none;
        d=google.com; s=arc-20240605;
        b=P3NOLem+6tfrldr7J/I4H5L74F7p98eby725ypc6pM0Gz4vA7qKf5Oard2p9qvmxAp
         zCOYt1Z4n0ee47NuEAq4wnrXnOUZFfjgpAoT9qgMaEM5BADlbBTHqVigCAgYExj8pB5R
         VCF9wCY6ZbBPBuGeE6dujCy41d1qiyjQGDRQzN4uEDMAPE3+iQCku+aPzsd+vv1PWK1Q
         HSuKR9qE+UObZYXSkfa/i2l34kf9cFywSRgEQHZrAdiv3k6fMVzKu8JrbPzHHBNlBFBy
         qf4KRu4P7dVfi4ZDW0fhHeV8TsuTIiKMabc5jclrd5lU6/xHjbflMhZqjhcbdkqMWTC6
         AMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        fh=4dcUwEKEQon0FLYyTqaewVzH+2Tr9JmgEdSulb+9Zpc=;
        b=dWQCTTTvx5w+X7uWRe6rCoz/IGlDpvbLFjxWZw+gBKzmmg6tF4Gm0Y0PS44R+ut56j
         OjGI//GfSODGBo4NJrcChNqckFcDjTupaMgJzImh7ir4urvPxYgcVdqxGPgA31ezD2ls
         tlf1kwasF310Sw9dd0gkpcNgvg7H0XKRxmavTkcyE2e1kbvZLPvu6U92J6WuR1oBPGaK
         d3i3xi3XbEFkvfWFGtYeDb3Ac+f+Za3F76+K1d82cT5I0hd8BaxQT3LDLgraKRkcncCX
         BBqDJTgT/ugQ8/e2BaA76TLWSi6eAOwHdZBNITKK1ZNkbTMwXuF35HZfAx07CpvlPGVL
         5qrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781710767; x=1782315567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        b=lAtriQHngSIqqdhMkMlZJCpAcjBV1Zn0iOHn3v5qFgMNuNDs8jDpx9jiWPCp1JLOvA
         /hC/++3i/escCCoin/bjepRWJYJe8AE2H6jBtvfg3GiXW59QqxvILvO/QDcspGS319IM
         VGj5o3aQ6anDfASTRCWe3gJvaDQTBr4NyvKzm8URMF8lslrHysgxDgOqBR8o5fHnDCMe
         CDuCEs6xIui9oD8fa44jtbxmALjReG6/qZurAoU95dlBjnBAxyOaltST1jbJjgzvU+jV
         W7wfGDHSXKKhznb1rmZCBN5AN8rJFlXTzuHdF1ikFn4o3V+YuqQW442Rxtw1Xk77MIjQ
         av8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710767; x=1782315567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7O+YFaniyt4mqlxJTogbnmDsFLsPWU7djzJQ4Y9xm8=;
        b=JkSkcqu/CZTv1FIJHNEyhs1yOdIdMKrCOVYk2DY47Vlqx2PPf2VOekJQSv2Ah9YZrt
         6GMJ6a2CKkphHxVVJNgM/b3DDM+wvoh78Ph4lzDY4kiYEEuET1k+x2N45yZjO7kffMqI
         8Lqk+U9rm3ya6vQyrtRtNC0H2dN31/goexVDzFTllM4geTIVdWwKDnYXeXONDLP9bmaY
         sIEaNA0WOutLCLLXsuUD/08IYBs2sxBcFgqK8DzxTqJtVn5PHLr038ZaAzyxVoZvzGK/
         OjKHxdymbcEqm0BgiFYThgNK57gX4W2TA7GNzV6T8y7QX045z+4SNiCBqFuXBtEfQjlW
         OuUw==
X-Forwarded-Encrypted: i=1; AFNElJ9ge4oHu0wwrbz45geUooa+Zk2XLFDlgokqiMZ2eZubYPmSRAJtt0WHpydPjTriJtaXUSNdhCqvUZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwf2JsMrI0IdHxlCZfBG6TvNcpNrRTANJfMAUNAEeLMpGRbULc
	ozs5hAyF4z8m/iwDOMjjdZ6fZRDNLdqgduUhGVQB/KTPhJxK8GRp4RLmWBY+rj4tArdrel93ldu
	vfkwAZ8L8EjFOM7Y3zSPK0qEWKqt5Lnlo6VN8LL1xuUvyMfpVvzaCGWQe
X-Gm-Gg: Acq92OFd/4dPVhODWvls6fOftXEncBKSaJbrOSrGTLQ0YTOTo3GbrC8l2fcDEnOSGRj
	foHQnHMYKpG0YOikD/vNMxMAGwk2kt8gEeh8mt/rDsV2SzIe48a61r7Yux9DNW8Le6F+VAgo1Om
	sN5mgTkjuLudTNAIlY1lxC+hdeuXHXN0EKBz+ww8A8VHmg6FaHQgoUTpt7Vi6Ua6rHfI0IZXi9v
	8984x7yGyzaQ36HrKJj+G9Sf8RMDXzAZDU+hH7OIJhwgKhnako6GvyxHq5HouFBi131z189yCSf
	xnU1R9bnNrGwb/uGDSfUtzjd8Vp936hXZgl/WQ==
X-Received: by 2002:a05:622a:5884:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-519aa962ed6mr11253791cf.10.1781710755155; Wed, 17 Jun 2026
 08:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <4d9c8dc420e2019e1fce62ecf31ec40933fce3a8.1781564384.git.abhishekbapat@google.com>
 <f5afcb7a-5b38-4c98-ac3e-529631bda4cb@linux.dev> <CAL41Mv7s9iA6a3YKV40E-9vk9WZfCjMEgBbLq_FVOjRS-PdVvA@mail.gmail.com>
In-Reply-To: <CAL41Mv7s9iA6a3YKV40E-9vk9WZfCjMEgBbLq_FVOjRS-PdVvA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 08:39:03 -0700
X-Gm-Features: AVVi8CeNyhEAJn89ckCO6vpBZ60MjcT4wEDr_0XaNZkmvpxfoh4Ep57-FKkkyNM
Message-ID: <CAJuCfpF12rccM5YEXhDicL4-aRifA5fQMUKRGN8M13zMnoWr+Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92644-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[surenb@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:hao.ge@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,get_at_params.data:url,linux.dev:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,end_cont_id.id:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BA9469B14D

On Tue, Jun 16, 2026 at 9:56=E2=80=AFAM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Mon, Jun 15, 2026 at 11:01=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Abhishek
> >
> >
> > On 2026/6/16 07:04, Abhishek Bapat wrote:
> > > Introduce a kselftest to verify the new IOCTL-based interface for
> > > /proc/allocinfo. The test covers:
> > >
> > > 1. Validation of the filename filter.
> > > 2. Validation of the function filter.
> > >
> > > The first test validates the functionality of the filename filter. Us=
ing
> > > "mm/memory.c" as the candidate filename filter, it retrieves filtered
> > > entries from both procfs and ioctl and matches the first VEC_MAX_ENTR=
IES
> > > entries.
> > >
> > > The second test validates the functionality of the function filter.
> > > It uses "dup_mm" as the candidate function as we do not expect this
> > > function name to change frequently and hence won't be needing to modi=
fy
> > > this test often.
> > >
> > > Note that both the tests match line no, function name and file name
> > > fields. Bytes allocated and calls are not matched as those values may
> > > change in the time when the data is being read from procfs and ioctl =
and
> > > hence can lead to false negatives.
> > >
> > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > ---
> > >   MAINTAINERS                                   |   1 +
> > >   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> > >   .../alloc_tag/allocinfo_ioctl_test.c          | 331 +++++++++++++++=
+++
> > >   3 files changed, 341 insertions(+)
> > >   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> > >   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioct=
l_test.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 019cc4c285a3..6610dd42e484 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16715,6 +16715,7 @@ F:    include/linux/alloc_tag.h
> > >   F:  include/linux/pgalloc_tag.h
> > >   F:  include/uapi/linux/alloc_tag.h
> > >   F:  lib/alloc_tag.c
> > > +F:   tools/testing/selftests/alloc_tag/
> > >
> > >   MEMORY CONTROLLER DRIVERS
> > >   M:  Krzysztof Kozlowski <krzk@kernel.org>
> > > diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testi=
ng/selftests/alloc_tag/Makefile
> > > new file mode 100644
> > > index 000000000000..f2b8fc022c3b
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/alloc_tag/Makefile
> > > @@ -0,0 +1,9 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +TEST_GEN_PROGS :=3D allocinfo_ioctl_test
> > > +
> > > +CFLAGS +=3D -Wall
> > > +CFLAGS +=3D -I../../../../usr/include
> >
> >
> > I think we should replace -I../../../../usr/include with $(KHDR_INCLUDE=
S).
> >
> >
> > > +
> > > +include ../lib.mk
> > > +
> >
> >
> > We would also introduce an extra field in the parent directory,
> >
> > allowing our alloc_tag target to be built when running make
> >
> > within /home/linux/tools/testing/selftests.
> >
> > like this:
> >
> > --- a/tools/testing/selftests/Makefile
> > +++ b/tools/testing/selftests/Makefile
> > @@ -1,5 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   TARGETS +=3D acct
> > +TARGETS +=3D alloc_tag
> >   TARGETS +=3D alsa
> >   TARGETS +=3D amd-pstate
> >   TARGETS +=3D arm64
> >
> > Below is the relevant build log:
> >
> > [root@localhost selftests]# make -j8
> >    CC       acct_syscall
> >    CC       allocinfo_ioctl_test
> >
> > Below is the log from running make clean:
> >
> > [root@localhost selftests]# make clean
> > rm -f -r /home/linux/tools/testing/selftests/acct/acct_syscall
> > rm -f -r /home/linux/tools/testing/selftests/alloc_tag/allocinfo_ioctl_=
test
> >
> >
> > (Sorry about this inconvenience. I had limited experience with the
> > kselftest framework,
> >
> > so I reached out to my teammates to sort out the relevant build logic.
> >
> > It's my fault for not catching this issue in prior reviews
> >
> > and forcing you to send a revised patch.)
> >
> >
> Before writing this patch, I had discussed this with Suren and he was
> of the opinion that this should be done later in a separate patch. So
> I'll let Suren answer this further.

Hmm. Don't recall exact details of that discussion but it does not
make sense to introduce an issue just to clean it up later. I agree
with Hao and if I said otherwise before, I was wrong.
Thanks,
Suren.

>
> > > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c=
 b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > new file mode 100644
> > > index 000000000000..62d5a488a04d
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > @@ -0,0 +1,331 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +/* kselftest for allocinfo ioctl
> > > + * allocinfo ioctl retrives allocinfo data through ioctl
> > > + * Copyright (C) 2026 Google, Inc.
> > > + */
> > > +
> > > +#include <errno.h>
> >
> >
> > errno.h is unused and may be dropped.
> >
> >
> > > +#include <fcntl.h>
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <stdbool.h>
> > > +#include <unistd.h>
> > > +#include <sys/ioctl.h>
> > > +#include <linux/types.h>
> > > +#include <linux/alloc_tag.h>
> > > +#include "../kselftest.h"
> > > +
> > > +#define MAX_LINE_LEN         512
> > > +#define ALLOCINFO_PROC               "/proc/allocinfo"
> > > +
> > > +enum ioctl_ret {
> > > +     IOCTL_SUCCESS =3D 0,
> > > +     IOCTL_FAILURE =3D 1,
> > > +     IOCTL_INVALID_DATA =3D 2,
> > > +};
> > > +
> > > +#define VEC_MAX_ENTRIES 32
> > > +
> > > +struct allocinfo_tag_data_vec {
> > > +     struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
> > > +     __u64 count;
> > > +};
> > > +
> > > +static inline int __allocinfo_get_content_id(int dev_fd, struct allo=
cinfo_content_id *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
> > > +}
> > > +
> > > +static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_ge=
t_at *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
> > > +}
> > > +
> > > +static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_=
tag_data *params)
> > > +{
> > > +     return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
> > > +}
> > > +
> > > +static bool match_entry(const struct allocinfo_tag_data *procfs_entr=
y,
> > > +                     const struct allocinfo_tag_data *tag_data,
> > > +                     bool match_bytes, bool match_calls, bool match_=
lineno,
> > > +                     bool match_function, bool match_filename)
> > > +{
> > > +     if (match_bytes && tag_data->counter.bytes !=3D procfs_entry->c=
ounter.bytes) {
> > > +             ksft_print_msg("size retrieved through ioctl does not m=
atch procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_calls && tag_data->counter.calls !=3D procfs_entry->c=
ounter.calls) {
> > > +             ksft_print_msg("call count retrieved through ioctl does=
 not match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_lineno && tag_data->tag.lineno !=3D procfs_entry->tag=
.lineno) {
> > > +             ksft_print_msg("lineno retrieved through ioctl does not=
 match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_function &&
> > > +         strncmp(tag_data->tag.function, procfs_entry->tag.function,=
 ALLOCINFO_STR_SIZE)) {
> > > +             ksft_print_msg("function retrieved through ioctl does n=
ot match procfs\n");
> > > +             return false;
> > > +     }
> > > +
> > > +     if (match_filename &&
> > > +         strncmp(tag_data->tag.filename, procfs_entry->tag.filename,=
 ALLOCINFO_STR_SIZE)) {
> > > +             ksft_print_msg("filename retrieved through ioctl does n=
ot match procfs\n");
> > > +             return false;
> > > +     }
> > > +     return true;
> > > +}
> > > +
> > > +static bool match_entries(const struct allocinfo_tag_data_vec *procf=
s_entries,
> > > +                       const struct allocinfo_tag_data_vec *tags,
> > > +                       bool match_bytes, bool match_calls, bool matc=
h_lineno,
> > > +                       bool match_function, bool match_filename)
> > > +{
> > > +     __u64 i;
> > > +
> > > +     if (procfs_entries->count !=3D tags->count) {
> > > +             ksft_print_msg("Entry count mismatch. ioctl entries: %l=
lu, proc entries: %llu\n",
> > > +                            tags->count, procfs_entries->count);
> > > +             return false;
> > > +     }
> > > +     for (i =3D 0; i < procfs_entries->count; i++) {
> > > +             if (!match_entry(&procfs_entries->tag[i], &tags->tag[i]=
,
> > > +                              match_bytes, match_calls, match_lineno=
,
> > > +                              match_function, match_filename)) {
> > > +                     ksft_print_msg("%lluth entry does not match.\n"=
, i);
> > > +                     return false;
> > > +             }
> > > +     }
> > > +     return true;
> > > +}
> > > +
> > > +static const char *allocinfo_str(const char *str)
> > > +{
> > > +     size_t len =3D strlen(str);
> > > +
> > > +     if (len >=3D ALLOCINFO_STR_SIZE)
> > > +             str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> > > +     return str;
> > > +}
> > > +
> > > +static void allocinfo_copy_str(char *dest, const char *src)
> > > +{
> > > +     strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
> > > +     dest[ALLOCINFO_STR_SIZE - 1] =3D '\0';
> > > +}
> > > +
> > > +static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec=
 *procfs_entries,
> > > +                                    const struct allocinfo_filter *f=
ilter)
> > > +{
> > > +     FILE *fp =3D fopen(ALLOCINFO_PROC, "r");
> > > +     char line[MAX_LINE_LEN];
> > > +     int matches;
> > > +     struct allocinfo_tag_data procfs_entry;
> > > +
> > > +     if (!fp) {
> > > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for r=
eading\n");
> > > +             return 1;
> > > +     }
> > > +     memset(procfs_entries, 0, sizeof(*procfs_entries));
> > > +     while (fgets(line, sizeof(line), fp) && procfs_entries->count <=
 VEC_MAX_ENTRIES) {
> > > +             char filename[MAX_LINE_LEN];
> > > +             char function[MAX_LINE_LEN];
> > > +
> > > +             memset(&procfs_entry, 0, sizeof(procfs_entry));
> > > +             matches =3D sscanf(line, "%llu %llu %[^:]:%llu func:%s"=
,
> > > +                              &procfs_entry.counter.bytes,
> > > +                              &procfs_entry.counter.calls,
> > > +                              filename,
> > > +                              &procfs_entry.tag.lineno,
> > > +                              function);
> > > +
> > > +             if (matches !=3D 5)
> > > +                     continue;
> > > +
> > > +             allocinfo_copy_str(procfs_entry.tag.filename, filename)=
;
> > > +             allocinfo_copy_str(procfs_entry.tag.function, function)=
;
> > > +
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
> > > +                     if (strncmp(procfs_entry.tag.filename,
> > > +                                 filter->fields.filename, ALLOCINFO_=
STR_SIZE))
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
> > > +                     if (strncmp(procfs_entry.tag.function,
> > > +                                 filter->fields.function, ALLOCINFO_=
STR_SIZE))
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
> > > +                     if (procfs_entry.tag.lineno !=3D filter->fields=
.lineno)
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
> > > +                     if (procfs_entry.counter.bytes < filter->min_si=
ze)
> > > +                             continue;
> > > +             }
> > > +             if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
> > > +                     if (procfs_entry.counter.bytes > filter->max_si=
ze)
> > > +                             continue;
> > > +             }
> > > +
> > > +             memcpy(&procfs_entries->tag[procfs_entries->count++], &=
procfs_entry,
> > > +                    sizeof(procfs_entry));
> > > +     }
> > > +     fclose(fp);
> > > +     return 0;
> > > +}
> > > +
> > > +static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_ta=
g_data_vec *tags,
> > > +                                              const struct allocinfo=
_filter *filter,
> > > +                                              __u64 start_pos)
> > > +{
> > > +     int fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > > +
> > > +     if (fd < 0) {
> > > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC " for I=
OCTL\n");
> > > +             return IOCTL_FAILURE;
> > > +     }
> > > +     struct allocinfo_content_id start_cont_id, end_cont_id;
> > > +     struct allocinfo_get_at get_at_params;
> > > +     const int max_retries =3D 10;
> > > +     int retry_count =3D 0;
> > > +     int status;
> > > +
> > > +     /*
> > > +      * __allocinfo_get_content_id may return different values if a =
kernel module was loaded
> > > +      * between the two calls. If that happens, the data gathered ca=
nnot be considered consistent
> > > +      * and hence needs to be fetched again to avoid flakiness.
> > > +      */
> > > +     do {
> > > +             if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     return IOCTL_FAILURE;
> >
> > Sashiko pointed out the fd leak in get_filtered_ioctl_entries().
> >
> > Since we already need to update the patch to fix the missing
> >
> > TARGETS entry in the top-level Makefile, we might as well fix
> >
> > this at the same time.
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
>
> Ahh I missed this code path interestingly. Ack, I'll remove these
> return statements here.
>
> > > +             }
> > > +
> > > +             memset(tags, 0, sizeof(*tags));
> > > +             memset(&get_at_params, 0, sizeof(get_at_params));
> > > +             memcpy(&get_at_params.filter, filter, sizeof(*filter));
> > > +             get_at_params.pos =3D start_pos;
> > > +             if (__allocinfo_get_at(fd, &get_at_params)) {
> > > +                     ksft_print_msg("allocinfo_get_at failed\n");
> > > +                     return IOCTL_FAILURE;
> > > +             }
> > > +             memcpy(&tags->tag[tags->count++], &get_at_params.data, =
sizeof(get_at_params.data));
> > > +
> > > +             while (tags->count < VEC_MAX_ENTRIES &&
> > > +                    __allocinfo_get_next(fd, &tags->tag[tags->count]=
) =3D=3D 0)
> > > +                     tags->count++;
> > > +
> > > +             if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     return IOCTL_FAILURE;
> > > +             }
> > > +
> > > +             if (start_cont_id.id =3D=3D end_cont_id.id) {
> > > +                     status =3D IOCTL_SUCCESS;
> > > +             } else {
> > > +                     ksft_print_msg("allocinfo_get_content_id mismat=
ch, retrying...\n");
> > > +                     status =3D IOCTL_INVALID_DATA;
> > > +             }
> > > +     } while (status =3D=3D IOCTL_INVALID_DATA && retry_count++ < ma=
x_retries);
> > > +
> > > +     close(fd);
> > > +     return status;
> > > +}
> > > +
> > > +static int run_filter_test(const struct allocinfo_filter *filter)
> > > +{
> > > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof=
(*procfs_entries));
> > > +     int ioctl_status;
> > > +     int ret =3D KSFT_PASS;
> > > +
> > > +     if (!tags || !procfs_entries) {
> > > +             ksft_print_msg("Memory allocation failed.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (get_filtered_procfs_entries(procfs_entries, filter)) {
> > > +             ksft_print_msg("Error retrieving entries from " ALLOCIN=
FO_PROC "\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (procfs_entries->count =3D=3D 0) {
> > > +             ksft_print_msg("No entries found in " ALLOCINFO_PROC ",=
 skipping test\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     ioctl_status =3D get_filtered_ioctl_entries(tags, filter, 0);
> > > +     if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> > > +             ksft_print_msg("Trouble retrieving valid IOCTL entries,=
 skipping.\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +     if (ioctl_status =3D=3D IOCTL_FAILURE) {
> > > +             ksft_print_msg("Error retrieving IOCTL entries.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     if (!match_entries(procfs_entries, tags, false, false, true, tr=
ue, true))
> > > +             ret =3D KSFT_FAIL;
> > > +
> > > +exit:
> > > +     free(tags);
> > > +     free(procfs_entries);
> > > +     return ret;
> > > +}
> > > +
> > > +static int test_filename_filter(void)
> > > +{
> > > +     struct allocinfo_filter filter;
> > > +     const char *target_filename =3D "mm/memory.c";
> > > +
> > > +     memset(&filter, 0, sizeof(filter));
> > > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FILENAME;
> > > +     strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_=
SIZE);
> > > +
> > > +     return run_filter_test(&filter);
> > > +}
> > > +
> > > +static int test_function_filter(void)
> > > +{
> > > +     struct allocinfo_filter filter;
> > > +     const char *target_function =3D "dup_mm";
> > > +
> > > +     memset(&filter, 0, sizeof(filter));
> > > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> > > +     strncpy(filter.fields.function, target_function, ALLOCINFO_STR_=
SIZE);
> > > +
> > > +     return run_filter_test(&filter);
> > > +}
> > > +
> > > +int main(int argc, char *argv[])
> > > +{
> > > +     int ret;
> > > +
> > > +     ksft_set_plan(2);
> > > +
> > > +     ret =3D test_filename_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_filename_filter\n"=
);
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_f=
ilter\n");
> > > +
> > > +     ret =3D test_function_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_function_filter\n"=
);
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_f=
ilter\n");
> > > +
> > > +     ksft_finished();
> > > +}

