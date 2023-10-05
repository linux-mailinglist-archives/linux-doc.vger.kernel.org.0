Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA737BA46A
	for <lists+linux-doc@lfdr.de>; Thu,  5 Oct 2023 18:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237614AbjJEQFa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Oct 2023 12:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237631AbjJEQEJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Oct 2023 12:04:09 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362342709
        for <linux-doc@vger.kernel.org>; Thu,  5 Oct 2023 07:34:41 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3514ece5ed4so89575ab.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Oct 2023 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696516481; x=1697121281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyGuZr+XMILOMkbkU/tMvucLHAoMRZjE0tey9bhv3AE=;
        b=YHZQ2fU6Zn1lRAMgcB6OeZpYphp4nPm65uPX2/8SviBg4DKpLo6BgQXdJ2blFLNPrG
         6tF9cG+Eerc/FAGOOZ7rAwDuJ5E6DwGWdHIPcutMEVp5zRMvZyLAWga6WVdc5MDFWBI5
         vr9l6QskDk0q0AzAv6EoAyLGG/j5nyOVL+5TNaSGW+oU7LRyLrBjFUsEZQdBWHKXWD4I
         LNOHEWIacPKx7nVJYYe8KfPlVsTBJh7ga/HTfSHNpjonVUMK8TQUjIKqVZwERghtt7Zg
         bPNsMZKOmR/LhbwC2Ejvc0s8GXRZe/81sB390Nd8TF386M7JeJfi8T4b/uRrag1DEAf+
         iP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696516481; x=1697121281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyGuZr+XMILOMkbkU/tMvucLHAoMRZjE0tey9bhv3AE=;
        b=TW1oQ1YCFgyvH5/YOVAkref5KtvmTMn85AenA0Jnsr9HbFDAiMM8106ZP7A2Xt4x2J
         rUYgvNjAdFOGVIfY4cJNrtbQOdw7l5b3LIobaMwjUpxH1zFK9h0MbEfOkldePLlAbx/A
         lCuh6pFzqf/nsc6mRlTv9MuFwm6X6JqyfCclrotkZrPlnOn0DEfQdT0ysIz0T1SOyoV1
         YQFL1jSxymjQDD37rQ7WJKcNKJRHmG8nnvYrFimQffIF+ylXR8zvu/1WaCDAiTrq+DrB
         kbJe3ziS3hBd/UbmD4rCFOoH6gJSLQkWwGKZ0V67U2K2ARq9uy6nwNvaTeSh2EXWnFIC
         1PLA==
X-Gm-Message-State: AOJu0Ywg2VNtri91vBvEKD4ScN2CGYSnUsVhH4rL+cQqWEgTcw9AaZVy
        C4FnADDrDUP/ojvaUaCxEm/vKqyhvdohoo7gGSXa+w==
X-Google-Smtp-Source: AGHT+IFcM9Onb+vq61O/YJOB8R9NL+8SWegKIHbaxpX90rMNBEWxlMLlcq6yQiE6GpKR0Xetr9+Vi9htuQda5VldPOk=
X-Received: by 2002:a92:cd88:0:b0:351:4bf9:5b15 with SMTP id
 r8-20020a92cd88000000b003514bf95b15mr125550ilb.28.1696516481042; Thu, 05 Oct
 2023 07:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230928191350.205703-1-tony.luck@intel.com> <20231003213043.13565-1-tony.luck@intel.com>
 <20231003213043.13565-4-tony.luck@intel.com>
In-Reply-To: <20231003213043.13565-4-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Thu, 5 Oct 2023 16:34:30 +0200
Message-ID: <CALPaoCgcqc-qq_yQokyzxBTuoxpCPRSuaZGmjOg91mdU3i=D=w@mail.gmail.com>
Subject: Re: [PATCH v8 3/8] x86/resctrl: Prepare for different scope for
 control/monitor operations
To:     Tony Luck <tony.luck@intel.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 3, 2023 at 11:30=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
>
> Resctrl assumes that control and monitor operations on a resource are
> performed at the same scope.
>
> Prepare for systems that use different scope (specifically L3 scope for
> cache control and NODE scope for cache occupancy and memory bandwidth
> monitoring).
>
> Create separate domain lists for control and monitor operations.
>
> Note that errors during initialization of either control or monitor
> functions on a domain would previously result in that domain being
> excluded from both control and monitor operations. Now the domains are
> allocated independently it is no longer required to disable both control
> and monitor operations if either fail.
>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
>
> ---
>
> Changes since last version:
>
> Initialize the "type" in rdt_domain_hdr when creating domains.
> Check type has expected value before using container_of() to
> get to the surrounding structure.
>
> Rename "hw_mondom" to "hw_dom" in domain_add_cpu_mon() and
> in domain_remove_cpu_mon().
>
> Add lockdep_assert_held(&rdtgroup_mutex) to resctrl_offline_mon_domain()

Thanks!

Reviewed-by: Peter Newman <peternewman@google.com>
