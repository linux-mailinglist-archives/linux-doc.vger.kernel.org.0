Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEA664F78E
	for <lists+linux-doc@lfdr.de>; Sat, 17 Dec 2022 05:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLQEor (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Dec 2022 23:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLQEop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 23:44:45 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F3530570
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 20:44:44 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id z8-20020aa79588000000b00576e8050ec9so2488554pfj.5
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 20:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lq5qLaqjn47UolL4tsokkeSChCFRg4lpAueP7xiyK5c=;
        b=hI3GPjV+otMa4Ye095FQjaGiWFlvwbSCtpy0DBUgqx9lFQzUf2P0+VMQ+0p2TVTqA5
         RWgmwjx++Vat5TAo6ZfBcEzl2ZRlK0ZvijwVXFFrEBj2H0CDfCxn7T4YMffcWbCjNa1k
         OJ1EPcqIFGczYb7jLwFDNuh3dCqMPAyPDyafE9GbwooLR5G9wHsJJe+T94Zh3w3gAyx+
         mdEDkdd8xr1Tfwaqf9PpBiVqe0nyLrdo8K7KCclSR7jY4bh0MjIjPp0ejIeHUmkRkjI1
         wnNzvdOhssab9K/qDUX2tlWPiLFv8SGiFbH+aFMdn+xsjdYLaNd8mNcT9S/wPq2j5kby
         0GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lq5qLaqjn47UolL4tsokkeSChCFRg4lpAueP7xiyK5c=;
        b=BHyQSjOkdXCAsWJwC8IceuV/tbSCV4oaT9DSzCGr3/dH8T0664nS1xHPhQX4QeufPc
         BZaZD4NNPJ2A4qlvEqPC7MQ65bsZe2kUzE5QDggqHOF1AvQSUiNA5ZI1agvYmpB5xzUK
         Ufv3gFA7+Xz80ZFNtjCwV2o2Xs62pcB/qUKTmMO+z5X1zNTfP3eBO/tsgwahoEkvE8ZT
         7gknKM9iKK7pbHEyB8PGh6IGNJ1xXIr6NQ6bsnRCH1zKja+baZAIu+E+b7++QXWV4kc7
         RyYAZEYW0Pw17xeMFT24Kia1g7yWTnCXv19P/xWrAMSZ4hr9m3iMv9Jzx72dvLIKzEXH
         aYKw==
X-Gm-Message-State: AFqh2koZ5clf1eTajSamkpzgQV2PRNR+VnCt9UGRoPvQC+31+fPeqKYx
        BKpx+6RpYaUB/Q5mlBX1q0+03fUW6qrpYw==
X-Google-Smtp-Source: AMrXdXvH1QaOoHmXxQnjA4mtzl2imb7fSbG7jRPeov73t2X0+amIt1J7VPlYImsSKZuDLTlFJocq/RGIXZxZFA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:d318:b0:220:1f03:129b with SMTP
 id p24-20020a17090ad31800b002201f03129bmr138587pju.0.1671252283386; Fri, 16
 Dec 2022 20:44:43 -0800 (PST)
Date:   Sat, 17 Dec 2022 12:44:33 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221217044436.4138642-1-davidgow@google.com>
Subject: [PATCH 0/3] rust: arch/um: Rust support for UML
From:   David Gow <davidgow@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org,
        linux-um@lists.infradead.org, llvm@lists.linux.dev,
        linux-doc@vger.kernel.org, kunit-dev@googlegroups.com,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Daniel Latypov <dlatypov@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series adds support for building and running code in the Rust
programming language under x86_64 UML kernels.

It is based on two Pull Requests from the Rust-for-Linux GitHub page:
- https://github.com/Rust-for-Linux/linux/pull/766
- https://github.com/Rust-for-Linux/linux/pull/881

The series consists of three patches: the first two set up various
compiler options to match both the UML and the X86 CFLAGS.

Rust support can be enabled by setting CONFIG_RUST=y, when the suitable
Rust compiler and bindgen versions are available (run make rustavaiable
to check). LLVM=1 is also required at present with all Rust builds.

The whole thing can be built and tested with kunit.py:
./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y --make_options LLVM=1

(Note that there are no Rust-based KUnit tests upstream yet. The "rust"
branch of the Rust-for-Linux GitHub repository does use KUnit for its
"doctests", and all of those tests pass under UML with these patches.)

This series is currently based on the uml/next branch: I'm happy to
rebase it next year once we're past the 6.2 merge window (though it
applies cleanly to torvalds/master at the moment). Equally, it
should be possible to take these changes in via the rust tree instead,
but since it's mostly UML Makefile changes, it probably makes more sense
for it to go in via the uml tree.

Also note that this series marks UML as a "maintained" architecture for
Rust support. It's definitely my intention to keep this working, but if
anyone has serious concerns, we can downgrade that.

Cheers,
-- David

David Gow (3):
  rust: arch/um: Use 'pie' relocation mode under UML
  rust: arch/um: Disable FP/SIMD instruction to match x86
  rust: arch/um: Add support for CONFIG_RUST under x86_64 UML

 Documentation/rust/arch-support.rst | 2 ++
 arch/um/Kconfig                     | 1 +
 arch/um/Makefile                    | 2 ++
 arch/x86/Makefile.um                | 6 ++++++
 4 files changed, 11 insertions(+)

-- 
2.39.0.314.g84b9a713c41-goog

