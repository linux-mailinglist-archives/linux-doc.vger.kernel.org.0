Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4106232670
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jul 2020 22:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgG2Ut6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jul 2020 16:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2Ut6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 16:49:58 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF69C0619D2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 13:49:58 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id v6so10765258iow.11
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R5Zsab5WHMd96BIHQuVzitAMA+epsJ+V0jZwHn8dA5o=;
        b=vsK2k62dcrIC+j7NuJu5tFJVZZLCoEipXlUeyWrPqMetWdM/dFYlyFTItrpCVRRYvD
         VY2eDaigclW15J9jys61hsDYpfO+2v6patqdTlqUT4UHlVYyKYBSlZLrT+XIhhTPe0Pc
         js1yGKwHzPyk4A/guwrvprqdz+dTRmbYFs5oN59ESFzWQ0nmF2QmBmWhuDumN+oB55+h
         ATMY+qovO2foOZjlHo0kUVUGq/OuuEcWVQsJF6AtYWJkx9FgbMN+MuqSz7Oo/zI9MIYc
         B0K4fzcPEB0ai4a7YBsC3cUHABzrUFqmsTJum9AEl+asWvNQv1tFVhjCig9wDD1M94I8
         pfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R5Zsab5WHMd96BIHQuVzitAMA+epsJ+V0jZwHn8dA5o=;
        b=QSFSKxhu02yPAOhneJk2uR1aGdKj19TPYXMVp+omPEQ9cGTGcsj0CdSnG/1wCUdOdk
         xy+qYQx9uHMFDeSK7+AdN7LdWya9e1QJ9+wWvEYwK/P5IeMMENR1xmjj1UevP8xt6W5i
         6/Hdu5BLl2eoT3bnDfZHBezPH5NP7aP7UVsH2SMRhP22OYCDZiu05MRriZA6Pr7sq0Mw
         ayLMfDadW5X6XwYU396CHa2eWZrGCYS81ojY2bM5wVxI993Yd58lf59mtz4RWkbOg7Ix
         RkZ87JfTKnt5OQ7oL9AvSTsOXrfdkQsN+pA89tJfGMo328MSVUjeeOsn5C2zZRssYeYT
         x5fw==
X-Gm-Message-State: AOAM532lbJixgAKboC8lR2GbegN4jzIq1AyNnHYEby45FCIYWepdpP1U
        GPLMAGo7vF4SWAKCeOLSIZVArQN4ynDSQrlsYtgIYQ==
X-Google-Smtp-Source: ABdhPJykP3cigdlHoKqG9HXBVHxb00S2uMk0Rd0zeejwEgCfL36RmUxUIv9NVpE6v49yEqEYKi29HijrG8opdjzLfc0=
X-Received: by 2002:a5e:8611:: with SMTP id z17mr18066051ioj.177.1596055797247;
 Wed, 29 Jul 2020 13:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200728004446.932-1-graf@amazon.com> <87d04gm4ws.fsf@vitty.brq.redhat.com>
 <a1f30fc8-09f5-fe2f-39e2-136b881ed15a@amazon.com> <CALMp9eQ3OxhQZYiHPiebX=KyvjWQgxQEO-owjSoxgPKsOMRvjw@mail.gmail.com>
 <14035057-ea80-603b-0466-bb50767f9f7e@amazon.com> <CALMp9eSxWDPcu2=K4NHbx_ZcYjA_jmnoD7gXbUp=cnEbiU0jLA@mail.gmail.com>
 <69d8c4cd-0d36-0135-d1fc-0af7d81ce062@amazon.com> <CALMp9eSD=_soihVJD_8QVKkgGAieeaBcRcNf2gKBzKE7gU1Tjg@mail.gmail.com>
 <13877428-be3a-85a8-bcdc-3a21872ba0e6@amazon.com>
In-Reply-To: <13877428-be3a-85a8-bcdc-3a21872ba0e6@amazon.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Wed, 29 Jul 2020 13:49:45 -0700
Message-ID: <CALMp9eRiWCRT7fXbVgE52E=KH9m8nz-OQxoexTUocP8hX-fHVA@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Deflect unknown MSR accesses to user space
To:     Alexander Graf <graf@amazon.com>
Cc:     Aaron Lewis <aaronlewis@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>, kvm list <kvm@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Raslan, KarimAllah" <karahmed@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 29, 2020 at 1:46 PM Alexander Graf <graf@amazon.com> wrote:

> Do you have a rough ETA for Aaron's patch set yet? :)

Rough ETA: Friday (31 July 2020).
