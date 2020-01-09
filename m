Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB6E1363F5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2020 00:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgAIXm2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jan 2020 18:42:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43817 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgAIXm2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jan 2020 18:42:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id k197so58867pga.10
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2020 15:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:cc:to:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=YoRMhkZec9G754MeMpA3qyugr+9dP1r59sqNei59Bxc=;
        b=D35Tnx2qGOx5wYEODGub+OOGjjHIMqMro6ZmZhmjSXbAHjXU4M5d+fM8W0jNKs7+j2
         pjfHSASWvUBuPPbYqX1zPamNaz8n/fgfkW3ia4D0vunpEH3G+pn7KYoDTYQ/gG/mJmiI
         yvZhtWf9RkHB/m27NI/0O95YWzWaozyWygAmOBOOH9UhFnVVrTjxMRW8ZbQn1QaP3OEX
         rNaAhVf79aDKtq/2Xk6l1ta2KLUAW21SNVr+6upC4MdJCHtaXtPWLfl6yWgm8BV8UqeO
         loFErmafn0is/MVcTxKX6E3dgn4/Latu0qWQMrtB1090RsCxe1i3fPvJhggAfshogVe1
         3jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=YoRMhkZec9G754MeMpA3qyugr+9dP1r59sqNei59Bxc=;
        b=j9V7vB4Up6lYZcwavf4zNV/i8z9nTkDglsq/Wt6NhUiDXpRxkepIkfnEUIOQrlw0Ra
         IoUCNWNI8dCwry7Hu7z+rbEfvrHy8htxdjv7je3U/cSMJIqLpDTJaGB9gYEcLPSlU1ID
         ylJDDGTeNEFzt3x5aJvjhQU+7DZ2ATp6KErsYsKvHEOLsD6fqFLk8g3e6V+7PxRrU54D
         DQVBOssFDKnWb0yuZELuMogIE0PaEpZg2UPlwACHDOodmKxkNTrYSbWxQk4akTCsMUFF
         x9P7CBu8cLFLAtNHsFwFpX5cveBwGkVpBEtT4VuURvRpNzmNSJ7kOT/TV66seZKpytrn
         OpHQ==
X-Gm-Message-State: APjAAAU8JocXk2pl/A3lIkE+gB+knPbChnVLEc7omXLLtXrcso7LMzCH
        Vu0RLtD2MiY6RFlyo1o6SPoXhg==
X-Google-Smtp-Source: APXvYqymalA5zmwiQNv0P8QaSMt5qB4BiTihWTnSZaqORKmMdLg29qW7g8n0TfOd8rT3pRf6yvOpUg==
X-Received: by 2002:a65:5281:: with SMTP id y1mr575543pgp.327.1578613347669;
        Thu, 09 Jan 2020 15:42:27 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
        by smtp.gmail.com with ESMTPSA id o14sm38329pgm.67.2020.01.09.15.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 15:42:27 -0800 (PST)
Date:   Thu, 09 Jan 2020 15:42:27 -0800 (PST)
X-Google-Original-Date: Thu, 09 Jan 2020 15:34:58 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: [PATCH] RISC-V: Typo fixes in image header and documentation.
CC:     Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, merker@debian.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        palmer@sifive.com, mchehab+samsung@kernel.org
To:     corbet@lwn.net
In-Reply-To: <20191210072947.7018340c@lwn.net>
References: <20191210072947.7018340c@lwn.net>
  <4912c007ab6c19321c8c988ae2328efbfb3e582d.camel@wdc.com> <mhng-3a815562-1222-4737-a77c-6dab9948db79@palmerdabbelt-glaptop>
Message-ID: <mhng-94b9cad5-0d14-480f-b428-8752630064d2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Dec 2019 06:29:47 PST (-0800), corbet@lwn.net wrote:
> On Thu, 05 Dec 2019 15:03:10 -0800 (PST)
> Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> I'm assuming this is not going in through the RISC-V tree as it mostly touches
>> Documentation/.
>
> I was assuming it was going through the risc-v tree since it touches arch
> code :)  I can go ahead and apply it.

I don't see this in 5.5-rc5.

>
> Thanks,
>
> jon
