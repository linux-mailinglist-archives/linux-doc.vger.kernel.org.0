Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBEC194957
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2020 21:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCZUky (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Mar 2020 16:40:54 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:39416 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgCZUky (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 16:40:54 -0400
Received: by mail-il1-f195.google.com with SMTP id r5so6748415ilq.6
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oPnIxP1F2bUl2Vqj4vcE9x/qsmiFe4D9+mAco5rF8w8=;
        b=U1JZSvac6LlRtm/epOjONUgGEKFr582n6HvEnA1k+Ooa8XGren3qDlxVm6xr13+sDi
         /s5fJPa0GuCMLyK8mqVPE497Z3J6r7euU7rEF9CfP3asSK85rDOjci8zfHSRIulto8A+
         AmYKMwi9BAZlosf2ID7y2Z8XQqgl1ObsBptXCoWNfEJMuP8M2NXS4skDppAsvXpOFsZd
         /kpguI0bKRHFVrC+RdhpZcJA8T3R9LC34LFMsWwvYwBHvSFZrsPcrL/O0tYVYgFvftED
         5Tgu3RUXGaeLbUJcFenb05VQ9NNhZoOpjVmHOYbmUeHjDP9QfmJeZ/4XC+X1jMeUvypg
         qdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oPnIxP1F2bUl2Vqj4vcE9x/qsmiFe4D9+mAco5rF8w8=;
        b=bw7b5UV3BbA73ot5iB+Xsi2sIsUWGwiEukIJ6kYlMoc5CQPAaLqfbSZuHCqnN1voMH
         HDP91mb0y90FLFJPJ8W/w7Fs0NQfOMwL/RWBb5L4Qv6vN0aTc06uB5vvolWA9sjA7cuM
         +vNDLmNPMQU619Vb/rOgRbBczTDo9UiSxtOLQ5ZChdVhASsbTxtsHr50gf8m2T+TfuPs
         xjPSEKb1z7HfmXIOEfvHtXUaplxTEeuKqZ0j5upYC/RTP7vNKczGeSzwTRFRwB7y6cdh
         nBy9wtDc+MndOOjKldw1e91tx7/5ws7uumpQaGmIavTdjCKaxiUyD770egYVIJuwo9im
         bW4A==
X-Gm-Message-State: ANhLgQ3MFlm5JA2nUdqtxb8f+JAt8OIZhTWgSVnNoJwvbhfzTYWZksQn
        yxh0u6HcIGjae47mcPc2jqEvKTD04JEF2W2ixwZadyw5
X-Google-Smtp-Source: ADFU+vsPhdCWgraaEVcB+eEYFG9fMTbQynR8rOzV4/9B08a/32qxVwyySynEVOR9HN0I1yktzWVo6KHXeU4ueQz6jho=
X-Received: by 2002:a92:8316:: with SMTP id f22mr10695500ild.169.1585255253507;
 Thu, 26 Mar 2020 13:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACdnJutT1F7YJ5KFkyuaZv=nj8GqC+mrnoAsHZfMP1ZRNUQg3Q@mail.gmail.com>
 <FE871C2B-15BB-4089-A912-40F2E9FE680B@amacapital.net>
In-Reply-To: <FE871C2B-15BB-4089-A912-40F2E9FE680B@amacapital.net>
From:   Matthew Garrett <mjg59@google.com>
Date:   Thu, 26 Mar 2020 13:40:42 -0700
Message-ID: <CACdnJusd7m-c0zLmAjSq9Sb9HxyCkhyyp5W=4FMdysgu7_g=Sw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] x86: Trenchboot secure late launch Linux kernel support
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Daniel Kiper <daniel.kiper@oracle.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        trenchboot-devel@googlegroups.com,
        Ard Biesheuvel <ardb@kernel.org>, leif@nuviainc.com,
        eric.snowberg@oracle.com, piotr.krol@3mdeb.com,
        krystian.hebel@3mdeb.com, michal.zygowski@3mdeb.com,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        andrew.cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 26, 2020 at 1:33 PM Andy Lutomirski <luto@amacapital.net> wrote=
:
> As a straw-man approach: make the rule that we never call EFI after secur=
e launch. Instead we write out any firmware variables that we want to chang=
e on disk somewhere.  When we want to commit those changes, we reboot, comm=
it the changes, and re-launch. Or we deactivate the kernel kexec-style, sea=
l the image against PCRs, blow away PCRs, call EFI, relaunch, unseal the PC=
Rs, and continue on our merry way.

That breaks the memory overwrite protection code, where a variable is
set at boot and cleared on a controlled reboot. We'd also need to read
every variable and pass those values to the kernel in some way so the
read interfaces still work. Some platforms may also expect to be able
to use the EFI reboot call. As for the second approach - how would we
verify that the EFI code hadn't modified any user pages? Those
wouldn't be measured during the second secure launch. If we're calling
the code at runtime then I think we need to assert that it's trusted.

> I=E2=80=99m not sure how SMM fits in to this whole mess.

SMM's basically an unsolved problem, which makes the whole DRTM
approach somewhat questionable unless you include the whole firmware
in the TCB, which is kind of what we're trying to get away from.

> If we insist on allowing EFI calls and SMM, then we may be able to *measu=
re* our exposure to potentially malicious firmware, but we can=E2=80=99t el=
iminate it. I personally trust OEM firmware about as far as I can throw it.
