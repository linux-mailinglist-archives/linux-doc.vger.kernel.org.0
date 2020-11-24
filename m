Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290752C1F45
	for <lists+linux-doc@lfdr.de>; Tue, 24 Nov 2020 09:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730308AbgKXIA2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 03:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbgKXIA2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 03:00:28 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2AAC0613D6;
        Tue, 24 Nov 2020 00:00:27 -0800 (PST)
Received: from [77.20.159.110] (helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1khTFQ-0003Uf-0C; Tue, 24 Nov 2020 09:00:24 +0100
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 1/3] LICENSES: Add the CC-BY-4.0 license
Date:   Tue, 24 Nov 2020 09:00:01 +0100
Message-Id: <c07e51e153f453c83c77a75513ad3d5ec70ef1be.1606137108.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606137108.git.linux@leemhuis.info>
References: <cover.1606137108.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1606204827;b4e8ca47;
X-HE-SMSGID: 1khTFQ-0003Uf-0C
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the full text of the CC-BY-4.0 license to the kernel tree as well as
the required tags for reference and tooling.

The license text was copied directly from this url, but a 'Creative
Commons' was added before 'Attribution 4.0 International' in the first
line:

https://creativecommons.org/licenses/by/4.0/legalcode.txt

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Christoph Hellwig <hch@lst.de>
---
For context: Patch 2 of this series adds a text to the Documentation/ directory
which (for now) uses "GPL-2.0+ OR CC-BY-4.0", as I want to make it easy and
attractive for others to base their work on it. I'm not strongly attached to
CC-BY-4.0, but it seemed like the best choice: it's designed for such usage and
afaics better than using MIT for text files.

Christoph, I stumbled upon commit 19e6420e4170 ("LICENSES: Remove CC-BY-SA-4.0
license text"), where you wrote:

> Using non-GPL licenses for our documentation is rather problematic, as it can
> directly include other files, which generally are GPLv2 licensed and thus not
> compatible.

Do you think this could be an issue here, too? If so, how? The document I added
doesn't directly include other files; but yes, their title might get tracked in
by sphinx when it's processing the document. Is that something we should worry
about?

Can I prevent this or other licensing troubles somehow in the text that uses it?
Can I for example add a hint near the license tag to the header to prevent
trouble? Maybe something like this: "Make sure to use the plaintext version
straight from the sources in case you want to use this text under CC-BY-4.0, as
processed versions (like the HTML version) of this text will have text in them
that is taken from other files which that are not available under CC-BY-4.0
license"? Or should we declare CC-BY-4.0 only to be useful for dual-licensed
content (like those in LICENSES/dual/)? 

Ciao, Thorsten
---
 LICENSES/preferred/CC-BY-4.0 | 405 +++++++++++++++++++++++++++++++++++
 1 file changed, 405 insertions(+)
 create mode 100644 LICENSES/preferred/CC-BY-4.0

diff --git a/LICENSES/preferred/CC-BY-4.0 b/LICENSES/preferred/CC-BY-4.0
new file mode 100644
index 000000000000..20c39f42d95f
--- /dev/null
+++ b/LICENSES/preferred/CC-BY-4.0
@@ -0,0 +1,405 @@
+Valid-License-Identifier: CC-BY-4.0
+SPDX-URL: https://spdx.org/licenses/CC-BY-4.0
+Usage-Guide:
+  To use the Creative Commons Attribution 4.0 International license put
+  the following SPDX tag/value pair into a comment according to the
+  placement guidelines in the licensing rules documentation:
+    SPDX-License-Identifier: CC-BY-4.0
+License-Text:
+
+Creative Commons Attribution 4.0 International
+
+=======================================================================
+
+Creative Commons Corporation ("Creative Commons") is not a law firm and
+does not provide legal services or legal advice. Distribution of
+Creative Commons public licenses does not create a lawyer-client or
+other relationship. Creative Commons makes its licenses and related
+information available on an "as-is" basis. Creative Commons gives no
+warranties regarding its licenses, any material licensed under their
+terms and conditions, or any related information. Creative Commons
+disclaims all liability for damages resulting from their use to the
+fullest extent possible.
+
+Using Creative Commons Public Licenses
+
+Creative Commons public licenses provide a standard set of terms and
+conditions that creators and other rights holders may use to share
+original works of authorship and other material subject to copyright
+and certain other rights specified in the public license below. The
+following considerations are for informational purposes only, are not
+exhaustive, and do not form part of our licenses.
+
+     Considerations for licensors: Our public licenses are
+     intended for use by those authorized to give the public
+     permission to use material in ways otherwise restricted by
+     copyright and certain other rights. Our licenses are
+     irrevocable. Licensors should read and understand the terms
+     and conditions of the license they choose before applying it.
+     Licensors should also secure all rights necessary before
+     applying our licenses so that the public can reuse the
+     material as expected. Licensors should clearly mark any
+     material not subject to the license. This includes other CC-
+     licensed material, or material used under an exception or
+     limitation to copyright. More considerations for licensors:
+    wiki.creativecommons.org/Considerations_for_licensors
+
+     Considerations for the public: By using one of our public
+     licenses, a licensor grants the public permission to use the
+     licensed material under specified terms and conditions. If
+     the licensor's permission is not necessary for any reason--for
+     example, because of any applicable exception or limitation to
+     copyright--then that use is not regulated by the license. Our
+     licenses grant only permissions under copyright and certain
+     other rights that a licensor has authority to grant. Use of
+     the licensed material may still be restricted for other
+     reasons, including because others have copyright or other
+     rights in the material. A licensor may make special requests,
+     such as asking that all changes be marked or described.
+     Although not required by our licenses, you are encouraged to
+     respect those requests where reasonable. More considerations
+     for the public:
+    wiki.creativecommons.org/Considerations_for_licensees
+
+=======================================================================
+
+Creative Commons Attribution 4.0 International Public License
+
+By exercising the Licensed Rights (defined below), You accept and agree
+to be bound by the terms and conditions of this Creative Commons
+Attribution 4.0 International Public License ("Public License"). To the
+extent this Public License may be interpreted as a contract, You are
+granted the Licensed Rights in consideration of Your acceptance of
+these terms and conditions, and the Licensor grants You such rights in
+consideration of benefits the Licensor receives from making the
+Licensed Material available under these terms and conditions.
+
+
+Section 1 -- Definitions.
+
+  a. Adapted Material means material subject to Copyright and Similar
+     Rights that is derived from or based upon the Licensed Material
+     and in which the Licensed Material is translated, altered,
+     arranged, transformed, or otherwise modified in a manner requiring
+     permission under the Copyright and Similar Rights held by the
+     Licensor. For purposes of this Public License, where the Licensed
+     Material is a musical work, performance, or sound recording,
+     Adapted Material is always produced where the Licensed Material is
+     synched in timed relation with a moving image.
+
+  b. Adapter's License means the license You apply to Your Copyright
+     and Similar Rights in Your contributions to Adapted Material in
+     accordance with the terms and conditions of this Public License.
+
+  c. Copyright and Similar Rights means copyright and/or similar rights
+     closely related to copyright including, without limitation,
+     performance, broadcast, sound recording, and Sui Generis Database
+     Rights, without regard to how the rights are labeled or
+     categorized. For purposes of this Public License, the rights
+     specified in Section 2(b)(1)-(2) are not Copyright and Similar
+     Rights.
+
+  d. Effective Technological Measures means those measures that, in the
+     absence of proper authority, may not be circumvented under laws
+     fulfilling obligations under Article 11 of the WIPO Copyright
+     Treaty adopted on December 20, 1996, and/or similar international
+     agreements.
+
+  e. Exceptions and Limitations means fair use, fair dealing, and/or
+     any other exception or limitation to Copyright and Similar Rights
+     that applies to Your use of the Licensed Material.
+
+  f. Licensed Material means the artistic or literary work, database,
+     or other material to which the Licensor applied this Public
+     License.
+
+  g. Licensed Rights means the rights granted to You subject to the
+     terms and conditions of this Public License, which are limited to
+     all Copyright and Similar Rights that apply to Your use of the
+     Licensed Material and that the Licensor has authority to license.
+
+  h. Licensor means the individual(s) or entity(ies) granting rights
+     under this Public License.
+
+  i. Share means to provide material to the public by any means or
+     process that requires permission under the Licensed Rights, such
+     as reproduction, public display, public performance, distribution,
+     dissemination, communication, or importation, and to make material
+     available to the public including in ways that members of the
+     public may access the material from a place and at a time
+     individually chosen by them.
+
+  j. Sui Generis Database Rights means rights other than copyright
+     resulting from Directive 96/9/EC of the European Parliament and of
+     the Council of 11 March 1996 on the legal protection of databases,
+     as amended and/or succeeded, as well as other essentially
+     equivalent rights anywhere in the world.
+
+  k. You means the individual or entity exercising the Licensed Rights
+     under this Public License. Your has a corresponding meaning.
+
+
+Section 2 -- Scope.
+
+  a. License grant.
+
+       1. Subject to the terms and conditions of this Public License,
+          the Licensor hereby grants You a worldwide, royalty-free,
+          non-sublicensable, non-exclusive, irrevocable license to
+          exercise the Licensed Rights in the Licensed Material to:
+
+            a. reproduce and Share the Licensed Material, in whole or
+               in part; and
+
+            b. produce, reproduce, and Share Adapted Material.
+
+       2. Exceptions and Limitations. For the avoidance of doubt, where
+          Exceptions and Limitations apply to Your use, this Public
+          License does not apply, and You do not need to comply with
+          its terms and conditions.
+
+       3. Term. The term of this Public License is specified in Section
+          6(a).
+
+       4. Media and formats; technical modifications allowed. The
+          Licensor authorizes You to exercise the Licensed Rights in
+          all media and formats whether now known or hereafter created,
+          and to make technical modifications necessary to do so. The
+          Licensor waives and/or agrees not to assert any right or
+          authority to forbid You from making technical modifications
+          necessary to exercise the Licensed Rights, including
+          technical modifications necessary to circumvent Effective
+          Technological Measures. For purposes of this Public License,
+          simply making modifications authorized by this Section 2(a)
+          (4) never produces Adapted Material.
+
+       5. Downstream recipients.
+
+            a. Offer from the Licensor -- Licensed Material. Every
+               recipient of the Licensed Material automatically
+               receives an offer from the Licensor to exercise the
+               Licensed Rights under the terms and conditions of this
+               Public License.
+
+            b. No downstream restrictions. You may not offer or impose
+               any additional or different terms or conditions on, or
+               apply any Effective Technological Measures to, the
+               Licensed Material if doing so restricts exercise of the
+               Licensed Rights by any recipient of the Licensed
+               Material.
+
+       6. No endorsement. Nothing in this Public License constitutes or
+          may be construed as permission to assert or imply that You
+          are, or that Your use of the Licensed Material is, connected
+          with, or sponsored, endorsed, or granted official status by,
+          the Licensor or others designated to receive attribution as
+          provided in Section 3(a)(1)(A)(i).
+
+  b. Other rights.
+
+       1. Moral rights, such as the right of integrity, are not
+          licensed under this Public License, nor are publicity,
+          privacy, and/or other similar personality rights; however, to
+          the extent possible, the Licensor waives and/or agrees not to
+          assert any such rights held by the Licensor to the limited
+          extent necessary to allow You to exercise the Licensed
+          Rights, but not otherwise.
+
+       2. Patent and trademark rights are not licensed under this
+          Public License.
+
+       3. To the extent possible, the Licensor waives any right to
+          collect royalties from You for the exercise of the Licensed
+          Rights, whether directly or through a collecting society
+          under any voluntary or waivable statutory or compulsory
+          licensing scheme. In all other cases the Licensor expressly
+          reserves any right to collect such royalties.
+
+
+Section 3 -- License Conditions.
+
+Your exercise of the Licensed Rights is expressly made subject to the
+following conditions.
+
+  a. Attribution.
+
+       1. If You Share the Licensed Material (including in modified
+          form), You must:
+
+            a. retain the following if it is supplied by the Licensor
+               with the Licensed Material:
+
+                 i. identification of the creator(s) of the Licensed
+                    Material and any others designated to receive
+                    attribution, in any reasonable manner requested by
+                    the Licensor (including by pseudonym if
+                    designated);
+
+                ii. a copyright notice;
+
+               iii. a notice that refers to this Public License;
+
+                iv. a notice that refers to the disclaimer of
+                    warranties;
+
+                 v. a URI or hyperlink to the Licensed Material to the
+                    extent reasonably practicable;
+
+            b. indicate if You modified the Licensed Material and
+               retain an indication of any previous modifications; and
+
+            c. indicate the Licensed Material is licensed under this
+               Public License, and include the text of, or the URI or
+               hyperlink to, this Public License.
+
+       2. You may satisfy the conditions in Section 3(a)(1) in any
+          reasonable manner based on the medium, means, and context in
+          which You Share the Licensed Material. For example, it may be
+          reasonable to satisfy the conditions by providing a URI or
+          hyperlink to a resource that includes the required
+          information.
+
+       3. If requested by the Licensor, You must remove any of the
+          information required by Section 3(a)(1)(A) to the extent
+          reasonably practicable.
+
+       4. If You Share Adapted Material You produce, the Adapter's
+          License You apply must not prevent recipients of the Adapted
+          Material from complying with this Public License.
+
+
+Section 4 -- Sui Generis Database Rights.
+
+Where the Licensed Rights include Sui Generis Database Rights that
+apply to Your use of the Licensed Material:
+
+  a. for the avoidance of doubt, Section 2(a)(1) grants You the right
+     to extract, reuse, reproduce, and Share all or a substantial
+     portion of the contents of the database;
+
+  b. if You include all or a substantial portion of the database
+     contents in a database in which You have Sui Generis Database
+     Rights, then the database in which You have Sui Generis Database
+     Rights (but not its individual contents) is Adapted Material; and
+
+  c. You must comply with the conditions in Section 3(a) if You Share
+     all or a substantial portion of the contents of the database.
+
+For the avoidance of doubt, this Section 4 supplements and does not
+replace Your obligations under this Public License where the Licensed
+Rights include other Copyright and Similar Rights.
+
+
+Section 5 -- Disclaimer of Warranties and Limitation of Liability.
+
+  a. UNLESS OTHERWISE SEPARATELY UNDERTAKEN BY THE LICENSOR, TO THE
+     EXTENT POSSIBLE, THE LICENSOR OFFERS THE LICENSED MATERIAL AS-IS
+     AND AS-AVAILABLE, AND MAKES NO REPRESENTATIONS OR WARRANTIES OF
+     ANY KIND CONCERNING THE LICENSED MATERIAL, WHETHER EXPRESS,
+     IMPLIED, STATUTORY, OR OTHER. THIS INCLUDES, WITHOUT LIMITATION,
+     WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR
+     PURPOSE, NON-INFRINGEMENT, ABSENCE OF LATENT OR OTHER DEFECTS,
+     ACCURACY, OR THE PRESENCE OR ABSENCE OF ERRORS, WHETHER OR NOT
+     KNOWN OR DISCOVERABLE. WHERE DISCLAIMERS OF WARRANTIES ARE NOT
+     ALLOWED IN FULL OR IN PART, THIS DISCLAIMER MAY NOT APPLY TO YOU.
+
+  b. TO THE EXTENT POSSIBLE, IN NO EVENT WILL THE LICENSOR BE LIABLE
+     TO YOU ON ANY LEGAL THEORY (INCLUDING, WITHOUT LIMITATION,
+     NEGLIGENCE) OR OTHERWISE FOR ANY DIRECT, SPECIAL, INDIRECT,
+     INCIDENTAL, CONSEQUENTIAL, PUNITIVE, EXEMPLARY, OR OTHER LOSSES,
+     COSTS, EXPENSES, OR DAMAGES ARISING OUT OF THIS PUBLIC LICENSE OR
+     USE OF THE LICENSED MATERIAL, EVEN IF THE LICENSOR HAS BEEN
+     ADVISED OF THE POSSIBILITY OF SUCH LOSSES, COSTS, EXPENSES, OR
+     DAMAGES. WHERE A LIMITATION OF LIABILITY IS NOT ALLOWED IN FULL OR
+     IN PART, THIS LIMITATION MAY NOT APPLY TO YOU.
+
+  c. The disclaimer of warranties and limitation of liability provided
+     above shall be interpreted in a manner that, to the extent
+     possible, most closely approximates an absolute disclaimer and
+     waiver of all liability.
+
+
+Section 6 -- Term and Termination.
+
+  a. This Public License applies for the term of the Copyright and
+     Similar Rights licensed here. However, if You fail to comply with
+     this Public License, then Your rights under this Public License
+     terminate automatically.
+
+  b. Where Your right to use the Licensed Material has terminated under
+     Section 6(a), it reinstates:
+
+       1. automatically as of the date the violation is cured, provided
+          it is cured within 30 days of Your discovery of the
+          violation; or
+
+       2. upon express reinstatement by the Licensor.
+
+     For the avoidance of doubt, this Section 6(b) does not affect any
+     right the Licensor may have to seek remedies for Your violations
+     of this Public License.
+
+  c. For the avoidance of doubt, the Licensor may also offer the
+     Licensed Material under separate terms or conditions or stop
+     distributing the Licensed Material at any time; however, doing so
+     will not terminate this Public License.
+
+  d. Sections 1, 5, 6, 7, and 8 survive termination of this Public
+     License.
+
+
+Section 7 -- Other Terms and Conditions.
+
+  a. The Licensor shall not be bound by any additional or different
+     terms or conditions communicated by You unless expressly agreed.
+
+  b. Any arrangements, understandings, or agreements regarding the
+     Licensed Material not stated herein are separate from and
+     independent of the terms and conditions of this Public License.
+
+
+Section 8 -- Interpretation.
+
+  a. For the avoidance of doubt, this Public License does not, and
+     shall not be interpreted to, reduce, limit, restrict, or impose
+     conditions on any use of the Licensed Material that could lawfully
+     be made without permission under this Public License.
+
+  b. To the extent possible, if any provision of this Public License is
+     deemed unenforceable, it shall be automatically reformed to the
+     minimum extent necessary to make it enforceable. If the provision
+     cannot be reformed, it shall be severed from this Public License
+     without affecting the enforceability of the remaining terms and
+     conditions.
+
+  c. No term or condition of this Public License will be waived and no
+     failure to comply consented to unless expressly agreed to by the
+     Licensor.
+
+  d. Nothing in this Public License constitutes or may be interpreted
+     as a limitation upon, or waiver of, any privileges and immunities
+     that apply to the Licensor or You, including from the legal
+     processes of any jurisdiction or authority.
+
+
+=======================================================================
+
+Creative Commons is not a party to its public
+licenses. Notwithstanding, Creative Commons may elect to apply one of
+its public licenses to material it publishes and in those instances
+will be considered the “Licensor.” The text of the Creative Commons
+public licenses is dedicated to the public domain under the CC0 Public
+Domain Dedication. Except for the limited purpose of indicating that
+material is shared under a Creative Commons public license or as
+otherwise permitted by the Creative Commons policies published at
+creativecommons.org/policies, Creative Commons does not authorize the
+use of the trademark "Creative Commons" or any other trademark or logo
+of Creative Commons without its prior written consent including,
+without limitation, in connection with any unauthorized modifications
+to any of its public licenses or any other arrangements,
+understandings, or agreements concerning use of licensed material. For
+the avoidance of doubt, this paragraph does not form part of the
+public licenses.
+
+Creative Commons may be contacted at creativecommons.org.
+
-- 
2.28.0

