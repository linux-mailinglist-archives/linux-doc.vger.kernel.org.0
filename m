Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74694687CC0
	for <lists+linux-doc@lfdr.de>; Thu,  2 Feb 2023 12:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBBL4D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 06:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjBBL4C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 06:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824BF8C425
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675338913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xr+KgTIiqQ2KJxTX1uZ4GJF1dZDc2A5QOOlR6eCGPY0=;
        b=hnOsNRLGJ9RGFJPZQVu25yg8oPBeev9mTUZhdiOf6xT7YHwjnerUVedETy6CH7oWdhnSUU
        VqBjtq80S96rnja+x+b4zK5G7XYsumIkOCgWNAo0lYQllI/B66Bh8fv344fM6Gue5dRvwu
        zuptIdmg3hHWyc5fOHW80+xOc8v+G8A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-q9MqQ4PsOneGJGzxjZkCXw-1; Thu, 02 Feb 2023 06:55:12 -0500
X-MC-Unique: q9MqQ4PsOneGJGzxjZkCXw-1
Received: by mail-ej1-f70.google.com with SMTP id qn8-20020a170907210800b0088eda544bd6so1393770ejb.11
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 03:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xr+KgTIiqQ2KJxTX1uZ4GJF1dZDc2A5QOOlR6eCGPY0=;
        b=Eo0CTlIHjCr+MWWxWgbDYStWD+QLAGnXg6+KKRlHatn/mNKR8CGEx8yt24xxlddqMY
         ItGZ51P5vXScUC/WFoIKjy4HXSUFfPk6TL9Nz0Cz1bJWsuxOC4+EttL8LtjpwJDTHYsH
         MIQkSqeMywUsapuxJ704cMw1gqKiiE9lYCcHHUrPzG22rFZ+9sNDHP25o4T9Avq1wO+u
         7PGoXCyxR9s6rT6ktCe0kpadt+P++8sn/Ld3vrVBPa91FEEXwJ8PhI8ERSp0XMFM2ur3
         2LgLuP76Q2sprDRBjpa3SuLl2eIBRk29NzsmB9yVcZEtcBEARTDi6jKMi/eaONRh1P3p
         jYSw==
X-Gm-Message-State: AO0yUKVUR74XWsSicrlFFJlAHI7HjTKIleTNd80OMyq/EyalI/9rZ41j
        75SjuxoT3GPxF+4nKSy+/ncIPP1OoAne44zEYbGQmiBoHOc59hlPh2vl0I5vsKaT7BbZq+UPpKk
        RugHFhvwAZrE3sjicdlqN
X-Received: by 2002:a17:906:9ca:b0:872:14ea:1a7b with SMTP id r10-20020a17090609ca00b0087214ea1a7bmr6565682eje.13.1675338911254;
        Thu, 02 Feb 2023 03:55:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9vc2HLfUBQGoATYgpGp0RJ3bg0WzgEcFeMjSYRa5m++mRiEsjdUktA8bNS1IMqitmOJDML0Q==
X-Received: by 2002:a17:906:9ca:b0:872:14ea:1a7b with SMTP id r10-20020a17090609ca00b0087214ea1a7bmr6565633eje.13.1675338910554;
        Thu, 02 Feb 2023 03:55:10 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id bu14-20020a170906a14e00b0088991314edesm5740656ejb.7.2023.02.02.03.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 03:55:10 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 96235972BEC; Thu,  2 Feb 2023 12:55:08 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Vernet <void@manifault.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v3] Documentation/bpf: Document API stability
 expectations for kfuncs
In-Reply-To: <Y9tJY3ayftdowRVS@maniforge>
References: <20230201174449.94650-1-toke@redhat.com>
 <Y9tJY3ayftdowRVS@maniforge>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 02 Feb 2023 12:55:08 +0100
Message-ID: <875yckth7n.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

David Vernet <void@manifault.com> writes:

> On Wed, Feb 01, 2023 at 06:44:48PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Following up on the discussion at the BPF office hours (and subsequent
>> discussion), this patch adds a description of API stability expectations
>> for kfuncs. The goal here is to manage user expectations about what kind=
 of
>> stability can be expected for kfuncs exposed by the kernel.
>>=20
>> Since the traditional BPF helpers are basically considered frozen at this
>> point, kfuncs will be the way all new functionality will be exposed to B=
PF
>> going forward. This makes it important to document their stability
>> guarantees, especially since the perception up until now has been that
>> kfuncs should always be considered "unstable" in the sense of "may go aw=
ay
>> or change at any time". Which in turn makes some users reluctant to use
>> them because they don't want to rely on functionality that may be removed
>> in future kernel versions.
>>=20
>> This patch adds a section to the kfuncs documentation outlining how we a=
s a
>> community think about kfunc stability. The description is a bit vague and
>> wishy-washy at times, but since there does not seem to be consensus to
>> commit to any kind of hard stability guarantees at this point, I feat th=
is
>> is the best we can do.
>>=20
>> I put this topic on the agenda again for tomorrow's office hours, but
>> wanted to send this out ahead of time, to give people a chance to read it
>> and think about whether it makes sense or if there's a better approach.
>>=20
>> Previous discussion:
>> https://lore.kernel.org/r/20230117212731.442859-1-toke@redhat.com
>
> Again, thanks a lot for writing this down and getting a real / tangible
> conversation started.

You're welcome! Just a few quick notes on one or two points below, we
can continue the discussion at the office hours:

[..]

> While I certainly understand the sentiment, I personally don't think I'd
> describe this as the BPF community striking a balance in a way that
> differs from EXPORT_SYMBOL_GPL. At the end of the day, as Alexei said in
> [0], BPF APIs must never be a reason to block a change elsewhere in the
> kernel.
>
> [0]: https://lore.kernel.org/bpf/20230119043247.tktxsztjcr3ckbby@MacBook-=
Pro-6.local/

"Block" is not the same as "delay", though. If we wanted, we *could*
commit to a stronger guarantee, via the deprecation procedure. E.g.,
"kfuncs will never go away without first being marked as deprecated for
at least X kernel releases". Yes, this will add some friction to
development, but as long as this is stated up-front, subsystems could
make an informed choice when choosing whether to expose something via a
kfunc.

I don't think this is necessarily a bad idea, either, it would enforce
some discipline and make people think deeply about the API when exposing
something. Just like people do today when adding new UAPI, but without
the *indefinite* stability guarantees (i.e, mistakes can be fixed,
eventually).

[...]

> To that point, I would argue that a kfunc's stability guarantees are
> truly exactly the same as for any EXPORT_SYMBOL_GPL symbol. The only
> differences between the two are that:
>
> a) In some ways it's quite a bit easier to support kfunc stability
>    thanks to CO-RE.
>
> b) It's more difficult to gauge how widely used a kfunc is in comparison
>    to an EXPORT_SYMBOL_GPL consumer due to the fact that (at this point,
>    far) fewer BPF programs are upstreamed in comparison to modules.
>
> Unfortunately, the fact that most BPF programs live outside the tree is
> irrelevant to any obligation the kernel might have to accommodate
> them.

I don't really think it's true that it's exactly the same as for
EXPORT_SYMBOL_GPL. For BPF programs, we *do* care about out-of-tree
users, and we want to provide them reasonable stability guarantees, and
functionality being actively used is a signal we do take into account
when deciding whether to change a kfunc. Whereas with EXPORT_SYMBOL_GPL,
people are told in no uncertain terms to go away if they complain about
a symbol change that impacts an out-of-tree module.

> It would be great if we upstreamed more BPF programs, in which case it
> would be easier to change them when kfuncs change, and the signal of
> how widely used a kfunc is would be stronger and more self-evident.
> Perhaps it's worth calling that out as part of this doc as well well?

I don't think this is really feasible. As just one example, this would
imply that all the different BPF-enabled Kubernetes CNIs (Cilium, etc)
should live in the kernel tree, and subsystem authors should go in and
update their kfunc calls if they change on the kernel side. That's
hardly realistic? :)

-Toke

