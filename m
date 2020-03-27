Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C454194DC1
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2020 01:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgC0AKT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Mar 2020 20:10:19 -0400
Received: from mail-ua1-f74.google.com ([209.85.222.74]:41026 "EHLO
        mail-ua1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgC0AKQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 20:10:16 -0400
Received: by mail-ua1-f74.google.com with SMTP id 77so3130707uaj.8
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 17:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3tfyaLuAfpZuF8gPEN5kV8PywGPqjSpoYq8AR2MUYtk=;
        b=TJN6sC+8oWTSOJwb0xY0YeyXkIs1oTnqAMcAgSSYAR/XFKorS8Ft661exMPDkdbGAt
         5WPH3nuDvc8XnRSi2zhq2EGgPB4JuJDKMxbhSMxBiSPCz81FMZ3YvPEBSh/U9FXL8BCL
         EOUsX1awLt5XnsMs7i4raTlMYEcNkPKyfmA3+NGei5Jn0cttiS+WHt+NV9ASVy30XHVL
         lukWgxWshtOmkwYLvxqu/WgFPf5sWj4+VDD25dZJkbyfVpcVCNaN5MLMuGeFwGpLCkDT
         tTnsN4g2q8n3xv7G5eoYOLE493qNFdJX5evV7Y+ojj3AKLY/4dWhMuGPLmo8PMaPcYtA
         fytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3tfyaLuAfpZuF8gPEN5kV8PywGPqjSpoYq8AR2MUYtk=;
        b=R9iyztBHH6x3zA7RgWs1Y1q7F0GkBgIxmETbuLk0hsrQ4hRaXli3aTHfNX3EmPowCW
         nR1u04adBcuEzkTPBHIo0Ib+yky2xGjE28TagmWTEiPA0KFS+dDAIPARp1m5YVlBypiH
         +zsrup0oflODLSMUMmYQaq2ffKqY8bhsqvY1Flh0u7xNUSEtGvLFMLgmCKj7Y+nhVmI9
         r3fY55PIIW85ZYyd6wkxcv/VTUxinEITJJ74AflltesU4AWe6m9oJIfspbFxgEsJp8rl
         ICN3qaKFXehwU9H2UxFiaJ+xEp9nsWly00o2PiiRr3kTo8FnVbKXShcYpKs9W/THvexl
         2R3w==
X-Gm-Message-State: ANhLgQ1YnhMGT1mQX4Nan7gOqmB/5cxWYjKyYpVMtoNHVGrDXUeYmosf
        UQenNpRCT0rI/SFmKXeoCa1KQ/oDcR4HCLHm7gg=
X-Google-Smtp-Source: ADFU+vuX2Pv05iQ94hFa+uznmO7wr+zzCgMTzK+c3Val5FEKzSMZDc/oejp4XULlTsTjKFoC+Xktu4qoe3qpiEhnpBU=
X-Received: by 2002:a67:eccf:: with SMTP id i15mr5938910vsp.130.1585267813949;
 Thu, 26 Mar 2020 17:10:13 -0700 (PDT)
Date:   Thu, 26 Mar 2020 17:09:51 -0700
In-Reply-To: <6e26c798-1439-2bbd-6801-8fd21c4e6926@zytor.com>
Message-Id: <20200327000951.84071-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <6e26c798-1439-2bbd-6801-8fd21c4e6926@zytor.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v2] Documentation: x86: exception-tables: document CONFIG_BUILDTIME_TABLE_SORT
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     corbet@lwn.net
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide more information about __ex_table sorting post link.

The exception tables and fixup tables use a commonly recurring pattern
in the kernel of storing the address of labels as date in custom ELF
sections, then finding these sections, iterating elements within them,
and possibly revisiting them or modifying the data at these addresses.

Sorting readonly arrays to minimize runtime penalties is quite clever.

Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* Add Peter's note about early exception handling (final paragraph).

 Documentation/x86/exception-tables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/x86/exception-tables.rst b/Documentation/x86/exception-tables.rst
index ed6d4b0cf62c..81a393867f10 100644
--- a/Documentation/x86/exception-tables.rst
+++ b/Documentation/x86/exception-tables.rst
@@ -257,6 +257,9 @@ the fault, in our case the actual value is c0199ff5:
 the original assembly code: > 3:      movl $-14,%eax
 and linked in vmlinux     : > c0199ff5 <.fixup+10b5> movl   $0xfffffff2,%eax
 
+If the fixup was able to handle the exception, control flow may be returned
+to the instruction after the one that triggered the fault, ie. local label 2b.
+
 The assembly code::
 
  > .section __ex_table,"a"
@@ -344,3 +347,14 @@ pointer which points to one of:
      it as special.
 
 More functions can easily be added.
+
+CONFIG_BUILDTIME_TABLE_SORT allows the __ex_table section to be sorted post
+link of the kernel image, via a host utility scripts/sorttable. It will set the
+symbol main_extable_sort_needed to 0, avoiding sorting the __ex_table section
+at boot time. With the exception table sorted, at runtime when an exception
+occurs we can quickly lookup the __ex_table entry via binary search.
+
+This is not just a boot time optimization, some architectures require this
+table to be sorted in order to handle exceptions relatively early in the boot
+process. For example, i386 makes use of this form of exception handling before
+paging support is even enabled!
-- 
2.26.0.rc2.310.g2932bb562d-goog

