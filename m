Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE38243500E
	for <lists+linux-doc@lfdr.de>; Wed, 20 Oct 2021 18:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhJTQYv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Oct 2021 12:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJTQYu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 12:24:50 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F99C061749
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 09:22:35 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y7so3381431pfg.8
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AsIANaDEnDuXhpKm7gwaOuH/xV04ul7CfvYlvZYub/g=;
        b=hIa98Nzm4wn5I0bee4rK8AjEp+Da/+KCCvTIWp0IckELqd5QXd74SwY8Gm2KbieChy
         XDHimuoSI362xp30cEAny/C/6K9RCJm0Q3VMe6tfn3/ag3oBHx6tOB4jwvU1QFz83uFG
         Ru4BV+gFudVG9y+kRTPjqNE9YIlmd1FYSEB6Fs4W7M1p50QN48giWiG/pvQ29+iWcLyq
         HklKXIYrj8l6Z1qJTFvvt/kG2uCHhnE51/rQJWFm5vXdU0js2S+U9Ak1UW/L5zKtgJwz
         Ox+jEwVdlkmAa+Eey0SGIlWq1EUDhY2/LujQp/MNi9WlrBtwEw9NFZLtLavG8/wlpG0T
         dbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsIANaDEnDuXhpKm7gwaOuH/xV04ul7CfvYlvZYub/g=;
        b=EmPKuo/VVfcbbKPPWQLxXlh76p0UeM+7bGJiNDldv5kPetDmBKxopEHgrtGmpYeBAO
         DSyRwtVpuvE7Ge5pI3DEH1WyJzDtklN5BY57SAOLLRkdLJAEp0N+cvV8Ckk0Aytm/YFf
         wBKyCe3eDjTSYW5hTygWPW4GxLm/0bxSdrdj4tZ8oTQg0vw86PjoXroHpX4OhLC7z+zZ
         kYG1mn7bEah/Syc9zapr0q4HATIT2YbEQPl4AS0683EZtPbhs463i/YkPiNci/sayQWR
         0KSkmPw/Xct9cwjAWFq8Qfgp6U6VJsIHGl+sXoUpbQbs/gnKvrJW/SRwjoKK4x+HynDE
         1fDA==
X-Gm-Message-State: AOAM531STkMOD0nyL6jJuY6YuEekXUHHKN5jof5kLFZqYBg5H821EFZQ
        o89Dv1JeeCR0g0FjfO9iwxnCUU4CDkRE96yKjczUZw==
X-Google-Smtp-Source: ABdhPJzDP63xIcRb7NLHWlf3Xvnc+3zPfYVH0FR2foc/lDhPfVuY0gBMEp9v0ZbSoOHhCWpqAm60kyfZi7arrtXi9/A=
X-Received: by 2002:a63:3483:: with SMTP id b125mr181088pga.79.1634746954789;
 Wed, 20 Oct 2021 09:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
 <20211020013153.4106001-4-kaleshsingh@google.com> <20211020114805.3fbb7d94@gandalf.local.home>
In-Reply-To: <20211020114805.3fbb7d94@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Wed, 20 Oct 2021 09:22:24 -0700
Message-ID: <CAC_TJvceZ=+QoRM2Qt4uRtikG5WZ_+KEjbPreg3ss=OOHFV7QA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] tracing: Fix operator precedence for hist triggers expression
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021 at 8:48 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 19 Oct 2021 18:31:40 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > @@ -2391,60 +2460,61 @@ static int check_expr_operands(struct trace_array *tr,
> >  static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
> >                                    struct trace_event_file *file,
> >                                    char *str, unsigned long flags,
> > -                                  char *var_name, unsigned int level)
> > +                                  char *var_name, unsigned int *n_subexprs)
> >  {
> >       struct hist_field *operand1 = NULL, *operand2 = NULL, *expr = NULL;
> >       unsigned long operand_flags;
> >       int field_op, ret = -EINVAL;
> >       char *sep, *operand1_str;
> >
> > -     if (level > 3) {
> > +     if (*n_subexprs > 3) {
>
> Why limit the sub expressions, and not just keep the limit of the level of
> recursion. We allow 3 levels of recursion, but we could have more than 3
> sub expressions.
>
>
> If we have:  a * b + c / d - e * f / h
>
> It would break down into:
>               -
>        +            /
>    *       /     *     h
>  a   b   c  d  e  f
>
>
> Which I believe is 6 "sub expressions", but never goes more than three deep
> in recursion:
>
>    "a * b + c / d - e * f / h"
>
> Step 1:
>
>   op = "-"
>   operand1 = "a * b + c / d"
>   operand2 = "e * f / h"
>
> Process operand1: (recursion level 1)
>
>   op = "+"
>   operand1a = "a * b"
>   operand2a = "c / d"
>
> Process operand1a: (recursion level 2)
>
>   op = "*"
>   operand1b = "a"
>   operand2b = "b"
>
> return;
>
> Process operand1b: (recursion level 2)
>
>   op = "/"
>   operand1b = "c"
>   operand2b = "d"
>
> return;
>
> return;
>
> Process operand2: (recursion level 1)
>
>   op = "/"
>   operand1c = "e * f"
>   operand2c = "h"
>
> Process operand1c: (recursion level 2)
>
>   op = "*"
>   operand1c = "e"
>   operand2c = "f"
>
> return;
>
> return;
>
>
>
> > +
> > +     /* LHS of string is an expression e.g. a+b in a+b+c */
> > +     operand1 = parse_expr(hist_data, file, operand1_str, operand_flags, NULL, n_subexprs);
> >       if (IS_ERR(operand1)) {
> >               ret = PTR_ERR(operand1);
> >               operand1 = NULL;
>
> I wonder if we should look for optimizations, in case of operand1 and
> operand2 are both constants?
>
> Just perform the function, and convert it into a constant as well.

I think we achieve something like this by propagating up the
HIST_FIELD_FL_CONST flag. Thanks for the suggestions. I'll update this
in the next version.

Thanks,
Kalesh

>
> -- Steve
