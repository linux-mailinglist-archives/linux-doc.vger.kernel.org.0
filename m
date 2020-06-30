Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F45620F1BD
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2020 11:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731998AbgF3Jgo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Jun 2020 05:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730613AbgF3Jgn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 05:36:43 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6422C061755
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 02:36:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id q15so18134631wmj.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=yaOhFBmIqdn8G4lrtwHvUko5nSvGDP5g5mqN3hIlOT0=;
        b=mANY5A32i8Xy+WIr5jslEb6KJMif7iF1qzxgC6tqzDIyhbXDlubrFkGRvv17KOz1vm
         DII2C2sjbT0SA5QtOWC3rikX6g0TIDVksXlE1WBmXoEp4WtXimS2XIj+vUQDKFCQ1OwC
         MoNz8JuOwgUmGPizW8OxgxTQcTmOKjJTQVd+q4vhbTE+4B6DCH58RLmW6IKe7DgMCgjv
         OsXXjHFMAtwhR978XaZ0zoSIJGejy3aEkjbve+jCAezLx7GRLGipnVznG3yp4dlxWUup
         GnB0P8WAGtunjHN9mR1OE6rxRa0jgcsUGuRObl8rCkz7RkXWovMOjDKXPf1NCvUP5Ema
         eP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=yaOhFBmIqdn8G4lrtwHvUko5nSvGDP5g5mqN3hIlOT0=;
        b=mqDdEaric4hwzZbtA8gZZnyw2iA3dxnUulykkZrtx//xw2iFyh68okRkKCivqvBjRB
         kpM2YHVV4jFVX97LsQF7fSOil4wx4a5jQMPySGAK0y6V6FOk6BKazQ+GoW/ae2pTaSaP
         eIb/4QdudJkhk9RZK9U4bf/0w+A2eYLXyv+PFdsTTVmC7pQ1DhlSi055vVlO0L7tYLqc
         oRpfWYTuUtCM/FRDET5dDjfJ33o082bw51aoXxvA0r7wR2iwHksxGNQYh8WPTzcYapDT
         Jgite2E0KiGP7xNjvSW5ojt3gGPRC3jAcm/v32p/AgXiS4jaB9ZMTGAM2isBGSPHwibi
         bSgQ==
X-Gm-Message-State: AOAM5308uUU+wlgWDB6v4tGDHi18ChQAo+z3pD7hf8xhaWiuo/J6crMF
        qci63CgTyCaG26q6fA/IGZ4+4KNKPYU=
X-Google-Smtp-Source: ABdhPJwHunjXx/RLUoEt7TrvTZZBpJuDl+cFP0Xg4HKFJn9lm5Uol4Z2jknkTbH7j0IqbX1N7+ZDxQ==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr12380909wmb.113.1593509802412;
        Tue, 30 Jun 2020 02:36:42 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id j41sm3102267wre.12.2020.06.30.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 02:36:41 -0700 (PDT)
Date:   Tue, 30 Jun 2020 10:36:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: scripts/kernel-doc update
Message-ID: <20200630093640.GK1179328@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Good morning Jon, et al.,

Would someone be kind enough to update scripts/kernel-doc to elegantly
handle complex bitmap expressions in structures please?  Presently
only simple syntax is handled.  Something like:

struct foo {
       u8 arg : 10;
};

However, the bitmap is sometimes derived from some pre-processed
define or calculated.  Similar to the following examples.

Example 1:
---------

  File: drivers/misc/vmw_balloon.c

  struct vmballoon_batch_entry {
          u64 status : 5;
          u64 reserved : PAGE_SHIFT - 5;
          u64 pfn : 52;
  } __packed;

Example 2:
---------

  File: include/math-emu/single.h
  
  union _FP_UNION_S
  {
    float flt;
    struct {
  #if __BYTE_ORDER == __BIG_ENDIAN
      unsigned sign : 1;
      unsigned exp  : _FP_EXPBITS_S;
      unsigned frac : _FP_FRACBITS_S - (_FP_IMPLBIT_S != 0);
  #else
      unsigned frac : _FP_FRACBITS_S - (_FP_IMPLBIT_S != 0);
      unsigned exp  : _FP_EXPBITS_S;
      unsigned sign : 1;
  #endif
    } bits __attribute__((packed));
  };

The first example causes this warning:

 drivers/misc/vmw_balloon.c:262: warning: Function parameter or member '5' not described in 'vmballoon_batch_entry'

The second doesn't use kerneldoc, but is an example of a complex, but
totally possible/legitimate use-case.

Would it be feasible to make to make the regex which handles bitmaps
greedy up until the ';'?  Or perhaps someone can come up with
something more refined that would solve the problem.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
