Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CC65EB84F
	for <lists+linux-doc@lfdr.de>; Tue, 27 Sep 2022 05:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiI0DJ0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Sep 2022 23:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiI0DIK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 23:08:10 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC2A75FD1
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 20:02:41 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id a80so8506114pfa.4
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 20:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=85M7BEeaq9zxW2h3AU3e8O57XOSPgZunos10OsJfDq0=;
        b=KfigKs+pa68qGUfx08Fz5iZPF/LbCgHd5uxt/2Dh09KNMPECXa9wkgYQDDy1HXmGCV
         Y71VHxpZ8kiRBtnqJtoPdQsrWPXgvL0uXPs4xxdOjBkOj6/pYkI9X2XpMAa2Vdb+B0mM
         lSLI/IFeoBVrfsSvKaNYLN0lfIjsVSL31i7rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=85M7BEeaq9zxW2h3AU3e8O57XOSPgZunos10OsJfDq0=;
        b=gXfdzVPpdx7siO1hhguxUN+AIRxJJxy2l0e8V6CBQ1HtLbSsqGHTzKkO6CJlsZx6Me
         3uFYVl3eURwoeUlypXb2AV641nhCy5FWuEEtaOIewJSiUKNDmHI4jrOZKThI1FH/WeGJ
         shijE0FIVNW8cAM0hy2U9RuexOMSVfVelRvchzEXKaT0CAFH/XrNpKNeXy4CqJX0Lq8S
         Y9dSUdD/cezUHTx6waNHEGAtTH+8sbhZ1sC9jNLr81R2nMbmOGPZms6aBfDLjHh5DnaT
         3jDL2MsnjIbAnpNuQAbPN27tMtbyBaljSpcpMBQXSnP14Kyiw7Zuu1oXsZsiOZql83kE
         8smg==
X-Gm-Message-State: ACrzQf2nGuH7v2D9DqUEMbSXIRnrpvo7GQw1+rHm9650IJ+e0vyahyPK
        EacPEz7v1uiUJnEUKUaSC8piAQ==
X-Google-Smtp-Source: AMsMyM55rJie2+871SGa0Nl+9qYm+Jk7BeAdd3mOnkfA+n0BFLgxS701gzO7WRnXsgRXTP0GFUmsig==
X-Received: by 2002:a63:6b83:0:b0:43c:17e8:c2a5 with SMTP id g125-20020a636b83000000b0043c17e8c2a5mr21546502pgc.457.1664247738268;
        Mon, 26 Sep 2022 20:02:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f26-20020a639c1a000000b0042254fce5e7sm234514pge.50.2022.09.26.20.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 20:02:17 -0700 (PDT)
Date:   Mon, 26 Sep 2022 20:02:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] overflow: Fix kern-doc markup for functions
Message-ID: <202209261959.A202D045@keescook>
References: <20220926194713.1806917-1-keescook@chromium.org>
 <YzIUS/+H2YA7RBvA@casper.infradead.org>
 <202209261408.59F78C0D@keescook>
 <ada70afe-64d5-ccab-242e-9a3c3c85e6c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada70afe-64d5-ccab-242e-9a3c3c85e6c4@gmail.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 27, 2022 at 11:53:38AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> Somehow Kees added me in Cc:, so let me comment.  :-)
> 
> On Mon, 26 Sep 2022 14:09:10 -0700, Kees Cook wrote:
> > On Mon, Sep 26, 2022 at 10:06:19PM +0100, Matthew Wilcox wrote:
> >> On Mon, Sep 26, 2022 at 12:47:13PM -0700, Kees Cook wrote:
> >>> -/** check_add_overflow() - Calculate addition with overflow checking
> >>> +/**
> >>> + * check_add_overflow - Calculate addition with overflow checking
> >>>   *
> >>>   * @a: first addend
> >>>   * @b: second addend
> >>
> >> Why did you remove the ()?  And why didn't you delete the blank line?
> >> According to our documentation, the canonical form is:
> >>
> >>   /**
> >>    * function_name() - Brief description of function.
> >>    * @arg1: Describe the first argument.
> >>    * @arg2: Describe the second argument.
> >>    *        One can provide multiple line descriptions
> >>    *        for arguments.
> 
> Matthew, you call it the "canonical form", my take is more of a "template
> that is known to work".

Out of curiosity, why is the trailing "()" part of the standard
template? Isn't it redundant? Or is trying to help differentiate between
things that are non-callable? (i.e. a variable, etc.)

> > Hunh, everywhere I'd looked didn't have the "()" (which seems
> > redundant). The blank line was entirely aesthetics for me. If it's
> > supposed to be without a blank, I can fix it up everwhere.
> 
> So, I think this is more of a territory of preference or consistency
> rather than that of correctness.  Those extra blank lines can be confusing
> as most people expect it in front of description part.
> 
> get_maintainer.pl says Kees is the sole maintainer of overflow.h, so
> it's his call, I guess.

Well, maintainer or not, I want to make sure stuff is as readable as
possible by everyone else too. :) I'm happy to skip the blank lines!

-- 
Kees Cook
