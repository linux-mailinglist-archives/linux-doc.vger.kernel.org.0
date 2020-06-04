Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D8C1EEBDD
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2020 22:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgFDUZ3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Jun 2020 16:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbgFDUZ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jun 2020 16:25:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFB6C08C5C0
        for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2020 13:25:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so2679394plk.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2020 13:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M8rV5wMhr+CTs8zWrj1I0mKf+otww3BG2ynj9BMAk9c=;
        b=JHWy9+oaDCCQPV+LrS/GW4glpXwsJ+BPkxaB5OkyqvIZd+J91AYL13gzM4WSEoDndc
         QUw7/nsDDwWp9iV0s+Rn/55R3wC9Ia+u4dqaENDPPa6W0HFrXn1sVQ1Q7PvFoXfFqbcC
         HFzpYAH0ornyNVI3yDebE5rzy+eCafqkJO8s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M8rV5wMhr+CTs8zWrj1I0mKf+otww3BG2ynj9BMAk9c=;
        b=MlqECoFdDT6o5GWxg80S6aA5j3x+nQDgp+gcnnFLvkK39K7tkXxLOlKLeP0gr+slJ5
         sJkPBgokMXfy7hrL/fPcaLdmTOYF53tW2Cqby/bred18hPFXZOeUEUOT9w4V7O9pp1hE
         X/jnVvW1OksJxyQCRDGImBvWlumLzxwnGJoJntIe/aIGELRdpwHXCFBNvz6LqpSsrzRM
         mz+D+ArITRYo8CZVSrBKZX9vJcXOAOHw3X+s7oTaTLHCy/Zt3vl3FI57nhMcw1a5nJzx
         KKXIRpSnTiCVetIIKGWFzogH7OVps+slfKqF3Cpa5FO+4S+2YATsp14oTZEWtYzfOSFa
         MO/Q==
X-Gm-Message-State: AOAM533jJL1/ZARRHUvLG5LNsRpv4acjR6gj6S7e2o3rAU0ZkpI3fC93
        GWUXdm//4d3fdojT1JMMPQUadj8XdRIAhA==
X-Google-Smtp-Source: ABdhPJx5gjx/wHBmJvPVxVDergI4eThW/vphGdEs2oI7RZWROvAHDSkMtileUpP9eLY3tOxuNmGaVg==
X-Received: by 2002:a17:902:26f:: with SMTP id 102mr5844075plc.209.1591302328111;
        Thu, 04 Jun 2020 13:25:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z20sm4742914pgv.52.2020.06.04.13.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 13:25:27 -0700 (PDT)
Date:   Thu, 4 Jun 2020 13:25:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] docs: deprecated.rst: Add note to the use of
 struct_size() helper
Message-ID: <202006041322.35912ABB@keescook>
References: <20200604172138.GA21820@embeddedor>
 <202006041047.9B3E8FB951@keescook>
 <20200604182123.GD10051@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604182123.GD10051@embeddedor>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 04, 2020 at 01:21:23PM -0500, Gustavo A. R. Silva wrote:
> Yeah. My reasoning for is that it will take a while --at least one 
> development cycle more-- to completely get rid of all the 0/1-arrays.

Right -- but we need a place to point people when we tell them "please
don't use 0-byte and 1-byte arrays", and the deprecated.rst is the place
for that.

Having it in deprecated.rst once they're all gone only serves to explain
why various compiler flags are enabled, etc. But while they're being
removed, it serves as a single place to document the issue (as in, much
of the flex-array patch commit log "boilerplate" can actually be
repeated in deprecated.rst.

> But I think we can add this note while I continue working on the flexible-array
> conversions. Once that work is complete, I can go back and update the
> documentation. :)
> 
> What do you think?

I think we need to document it at the beginning of the work (and I
should have asked for this earlier). So let's just add a new section on
dynamic array usage, etc. It can include a note about struct_size() as
an example for why 1-byte arrays are so weird. :)

-- 
Kees Cook
