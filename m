Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2FC29E761
	for <lists+linux-doc@lfdr.de>; Thu, 29 Oct 2020 10:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgJ2Jcl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Oct 2020 05:32:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2Jcl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Oct 2020 05:32:41 -0400
Received: from mail.kernel.org (ip5f5ad5de.dynamic.kabel-deutschland.de [95.90.213.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A26AB2076B;
        Thu, 29 Oct 2020 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603963903;
        bh=LZwqyd2b2TXMNj90cWzNiiPkCzJ7iq4s4B7ElCgcLpI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yK9sPmK1IrXJ9rH9hPnDuBLlBH87pLpAO7LV2/RHYO16f9ZhfFaFERyCx/KeVu4dg
         l7RiAlWWLXTw/lR1Ar1qj8Wo6002y7gbd1QQl7eBtm9qjWb18XTL8H8j3tnsfqSVZx
         qRFZ0Rvt8wwUbmHvwTkCNZ0Z2M4ttW1H3jqhw4Fw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kY4HT-004Di3-RC; Thu, 29 Oct 2020 10:31:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Divya Bharathi <divya27392@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Divya Bharathi" <divya.bharathi@dell.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "LKML" <linux-kernel@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@dell.com>,
        "Prasanth KSR" <prasanth.ksr@dell.com>,
        "mark gross" <mgross@linux.intel.com>, dvhart@infradead.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] docs: ABI: sysfs-class-firmware-attributes: solve some warnings
Date:   Thu, 29 Oct 2020 10:31:23 +0100
Message-Id: <44b4181b4f772fcc5ec676e72b295c10df35121b.1603963862.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029090114.64daf4e3@coco.lan>
References: <20201029090114.64daf4e3@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Description: tag is missing on some places, causing
scripts/get_abi.pl warnings:

	Warning: file Documentation/ABI/testing/sysfs-class-firmware-attributes#172:
		What '/sys/class/firmware-attributes/*/authentication/' doesn't have a description

Also, some warnings are produced when generating html documentation:

	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Title underline too short.

	Dell specific class extensions
	--------------------------
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexpected indentation.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexpected indentation.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Block quote ends without a blank line; unexpected unindent.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Unexpected indentation.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Unexpected indentation.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Block quote ends without a blank line; unexpected unindent.
	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:111: WARNING: Inline emphasis start-string without end-string.

Address the warnings, making it to produce the expected
output for the documentation ABI.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../testing/sysfs-class-firmware-attributes   | 138 +++++++++++-------
 1 file changed, 86 insertions(+), 52 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 04a15c72e883..8ea59fea4709 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -12,17 +12,20 @@ Description:
 		Unless otherwise specified in an attribute description all attributes are optional
 		and will accept UTF-8 input.
 
-		type: A file that can be read to obtain the type of attribute.  This attribute is
-			mandatory.
+		type:
+		    A file that can be read to obtain the type of attribute.
+		    This attribute is mandatory.
 
 		The following are known types:
+
 			- enumeration: a set of pre-defined valid values
 			- integer: a range of numerical values
 			- string
 
 		All attribute types support the following values:
 
-		current_value:	A file that can be read to obtain the current
+		current_value:
+				A file that can be read to obtain the current
 				value of the <attr>.
 
 				This file can also be written to in order to update the value of a
@@ -30,59 +33,71 @@ Description:
 
 				This attribute is mandatory.
 
-		default_value:	A file that can be read to obtain the default
+		default_value:
+				A file that can be read to obtain the default
 				value of the <attr>
 
-		display_name:	A file that can be read to obtain a user friendly
+		display_name:
+				A file that can be read to obtain a user friendly
 				description of the at <attr>
 
-		display_name_language_code:	A file that can be read to obtain
+		display_name_language_code:
+						A file that can be read to obtain
 						the IETF language tag corresponding to the
 						"display_name" of the <attr>
 
 		"enumeration"-type specific properties:
 
-		possible_values:	A file that can be read to obtain the possible
+		possible_values:
+					A file that can be read to obtain the possible
 					values of the <attr>. Values are separated using
 					semi-colon (``;``).
 
 		"integer"-type specific properties:
 
-		min_value:	A file that can be read to obtain the lower
+		min_value:
+				A file that can be read to obtain the lower
 				bound value of the <attr>
 
-		max_value:	A file that can be read to obtain the upper
+		max_value:
+				A file that can be read to obtain the upper
 				bound value of the <attr>
 
-		scalar_increment:	A file that can be read to obtain the scalar value used for
+		scalar_increment:
+					A file that can be read to obtain the scalar value used for
 					increments of current_value this attribute accepts.
 
 		"string"-type specific properties:
 
-		max_length:	A file that can be read to obtain the maximum
+		max_length:
+				A file that can be read to obtain the maximum
 				length value of the <attr>
 
-		min_length:	A file that can be read to obtain the minimum
+		min_length:
+				A file that can be read to obtain the minimum
 				length value of the <attr>
 
 		Dell specific class extensions
-		--------------------------
+		------------------------------
 
 		On Dell systems the following additional attributes are available:
 
-		dell_modifier:	A file that can be read to obtain attribute-level
+		dell_modifier:
+				A file that can be read to obtain attribute-level
 				dependency rule. It says an attribute X will become read-only or
 				suppressed, if/if-not attribute Y is configured.
 
-				modifier rules can be in following format:
-				[ReadOnlyIf:<attribute>=<value>]
-				[ReadOnlyIfNot:<attribute>=<value>]
-				[SuppressIf:<attribute>=<value>]
-				[SuppressIfNot:<attribute>=<value>]
+				modifier rules can be in following format::
 
-				For example:
-				AutoOnFri/dell_modifier has value,
-					[SuppressIfNot:AutoOn=SelectDays]
+				    [ReadOnlyIf:<attribute>=<value>]
+				    [ReadOnlyIfNot:<attribute>=<value>]
+				    [SuppressIf:<attribute>=<value>]
+				    [SuppressIfNot:<attribute>=<value>]
+
+				For example::
+
+				    AutoOnFri/dell_modifier has value,
+					    [SuppressIfNot:AutoOn=SelectDays]
 
 				This means AutoOnFri will be suppressed in BIOS setup if AutoOn
 				attribute is not "SelectDays" and its value will not be effective
@@ -90,18 +105,22 @@ Description:
 
 		Enumeration attributes also support the following:
 
-		dell_value_modifier:	A file that can be read to obtain value-level dependency.
+		dell_value_modifier:
+					A file that can be read to obtain value-level dependency.
 					This file is similar to dell_modifier but here,	an
 					attribute's current value will be forcefully changed based
 					dependent attributes value.
 
-					dell_value_modifier rules can be in following format:
-					<value>[ForceIf:<attribute>=<value>]
-					<value>[ForceIfNot:<attribute>=<value>]
+					dell_value_modifier rules can be in following format::
+
+					    <value>[ForceIf:<attribute>=<value>]
+					    <value>[ForceIfNot:<attribute>=<value>]
+
+					For example:
+
+					    LegacyOrom/dell_value_modifier has value:
+						    Disabled[ForceIf:SecureBoot=Enabled]
 
-					For example,
-					LegacyOrom/dell_value_modifier has value:
-						Disabled[ForceIf:SecureBoot=Enabled]
 					This means LegacyOrom's current value will be forced to
 					"Disabled" in BIOS setup if SecureBoot is Enabled and its
 					value will not be effective through sysfs until this rule is
@@ -113,12 +132,13 @@ KernelVersion:	5.11
 Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
 		Mario Limonciello <mario.limonciello@dell.com>,
 		Prasanth KSR <prasanth.ksr@dell.com>
-
+Description:
 		Devices support various authentication mechanisms which can be exposed
 		as a separate configuration object.
 
 		For example a "BIOS Admin" password and "System" Password can be set,
 		reset or cleared using these attributes.
+
 		- An "Admin" password is used for preventing modification to the BIOS
 		  settings.
 		- A "System" password is required to boot a machine.
@@ -126,39 +146,50 @@ Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
 		Change in any of these two authentication methods will also generate an
 		uevent KOBJ_CHANGE.
 
-		is_enabled:		A file that can be read to obtain a 0/1 flag to see if
+		is_enabled:
+					A file that can be read to obtain a 0/1 flag to see if
 					<attr> authentication is enabled.
 					This attribute is mandatory.
 
-		role:			The type of authentication used.
+		role:
+					The type of authentication used.
 					This attribute is mandatory.
+
 					Known types:
-						bios-admin: Representing BIOS administrator password
-						power-on: Representing a password required to use
-							  the system
+						bios-admin:
+							Representing BIOS administrator password
+						power-on:
+							Representing a password required to use
+							the system
 
-		mechanism:		The means of authentication.  This attribute is mandatory.
+		mechanism:
+					The means of authentication.  This attribute is mandatory.
 					Only supported type currently is "password".
 
-		max_password_length:	A file that can be read to obtain the
+		max_password_length:
+					A file that can be read to obtain the
 					maximum length of the Password
 
-		min_password_length:	A file that can be read to obtain the
+		min_password_length:
+					A file that can be read to obtain the
 					minimum length of the Password
 
-		current_password:	A write only value used for privileged access such as
+		current_password:
+					A write only value used for privileged access such as
 					setting	attributes when a system or admin password is set
 					or resetting to a new password
 
 					This attribute is mandatory when mechanism == "password".
 
-		new_password:		A write only value that when used in tandem with
+		new_password:
+					A write only value that when used in tandem with
 					current_password will reset a system or admin password.
 
 		Note, password management is session specific. If Admin password is set,
 		same password must be written into current_password file (required for
 		password-validation) and must be cleared once the session is over.
-		For example:
+		For example::
+
 			echo "password" > current_password
 			echo "disabled" > TouchScreen/current_value
 			echo "" > current_password
@@ -180,12 +211,15 @@ Description:
 		pending BIOS attribute changes. Also, an uevent_KOBJ_CHANGE is
 		generated when it changes to 1.
 
-			0:	All BIOS attributes setting are current
-			1:	A reboot is necessary to get pending BIOS attribute changes
-				applied
+			==	=========================================
+			0	All BIOS attributes setting are current
+			1	A reboot is necessary to get pending BIOS
+			        attribute changes applied
+			==	=========================================
 
 		Note, userspace applications need to follow below steps for efficient
 		BIOS management,
+
 		1.	Check if admin password is set. If yes, follow session method for
 			password management as briefed under authentication section above.
 		2.	Before setting any attribute, check if it has any modifiers
@@ -208,17 +242,17 @@ Description:
 
 		Reading from it returns a list of supported options encoded as:
 
-			'builtinsafe' (Built in safe configuration profile)
-			'lastknowngood' (Last known good saved configuration profile)
-			'factory' (Default factory settings configuration profile)
-			'custom' (Custom saved configuration profile)
+			- 'builtinsafe' (Built in safe configuration profile)
+			- 'lastknowngood' (Last known good saved configuration profile)
+			- 'factory' (Default factory settings configuration profile)
+			- 'custom' (Custom saved configuration profile)
 
 		The currently selected option is printed in square brackets as
-		shown below:
+		shown below::
 
-		# echo "factory" > /sys/class/firmware-attributes/*/device/attributes/reset_bios
-		# cat /sys/class/firmware-attributes/*/device/attributes/reset_bios
-		# builtinsafe lastknowngood [factory] custom
+		    # echo "factory" > /sys/class/firmware-attributes/*/device/attributes/reset_bios
+		    # cat /sys/class/firmware-attributes/*/device/attributes/reset_bios
+		    # builtinsafe lastknowngood [factory] custom
 
 		Note that any changes to this attribute requires a reboot
 		for changes to take effect.
-- 
2.26.2

