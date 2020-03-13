Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8548D185265
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2020 00:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgCMXgJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Mar 2020 19:36:09 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38361 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgCMXgJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Mar 2020 19:36:09 -0400
Received: by mail-pj1-f65.google.com with SMTP id m15so4497864pje.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2020 16:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yb3Smk+WA2kNJUHhi0CWWEYTegjFeAzvGSfP7GO6hE=;
        b=TflqlyHTwj9HWSK9TQZowQOwFWsskqIaBoymjzHlLwmtLBJMVYPsTb+R3GWOs1v7Ti
         xlvTgLPvWJed7HLrQH8YrIMgOeF6jKFF9CIgnSc1hJ4qmjM7hSyNWEs8ClRU/KW6Y1vm
         e1Q0pVlXHRzHL8W8jn4mh54p4elTmSHBw8/VvAy7UGeulkhCyW/CaFWV2qcpiXjHwHUO
         UfKHHNJ6SknFlGqR7h2epcW8wVWlUC21bgck0h9n1j7wBEqPC0heISglpGIB6/heU2lY
         JJkeNi9Xcvu5HkXCOP4hNipZMybBhCnY/Ei6jGUFNbrgm4a3uyXJ/jZk0ftJRfrsv1tt
         kjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yb3Smk+WA2kNJUHhi0CWWEYTegjFeAzvGSfP7GO6hE=;
        b=gjHHWCCU7H3n8wTA8cuXzSsSxCaj5x/M0SXZZHDeVbpaNeNYQmkFQvyIzwyfjcGgeo
         EaL0vHEEHFzX44wc9mfDSsKSX1k2oEQGa2hvs8Xbn8ykvulRvbnc+UB9pLwYWMn6P48X
         bbb3ySDgvq0EaGOkIv8xrBNEO8zoKJXQ5L46CJl+h2aq009l3tkdqqeOHa35Wl0dOeT0
         RwpU6NJM5q/Q1EVdeUznfcY5RT07QjvPB16z3LB7y8xEPclPwM7Avhmr8PFWeIjZG9BA
         0Z9ztDUFV9tujXY2d8CNr4s/om9eO1Q3jBWQPK6tZ7xIxIWVYNFtDzFfl1HO594iWAmX
         9hIA==
X-Gm-Message-State: ANhLgQ1n8KwNwAbJwmfih0Sh0ROu7dICmPGKPQwXnsP/lRZht0Xvx92i
        DH2FNQvhjIg16SE9vjhrtNoJf0FWwxRWQTXHKtaoLg==
X-Google-Smtp-Source: ADFU+vslN70O13CIstyDYtjFT6z/TCx8Q8y8naQJ4HvhFoYnijLayIc1CiIYxlFlDENFpInoZkezf8Yo91jWhTHpC3w=
X-Received: by 2002:a17:90b:d8d:: with SMTP id bg13mr11892026pjb.29.1584142567940;
 Fri, 13 Mar 2020 16:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200228191821.42412-1-davidgow@google.com>
In-Reply-To: <20200228191821.42412-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 13 Mar 2020 16:35:56 -0700
Message-ID: <CAFd5g446OxmrseU=U-n7D1bL3OdgFF=sYZmUg2utx_Sa9LEF1w@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: kunit: Make the KUnit documentation
 less UML-specific
To:     David Gow <davidgow@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Frank Rowand <frank.rowand@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 28, 2020 at 11:18 AM David Gow <davidgow@google.com> wrote:
>
> Remove some of the outmoded "Why KUnit" rationale, and move some
> UML-specific information to the kunit_tool page. Also update the Getting
> Started guide to mention running tests without the kunit_tool wrapper.
>
> Signed-off-by: David Gow <davidgow@google.com>
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
